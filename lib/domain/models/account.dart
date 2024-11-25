import 'dart:convert';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SpotifyAccountManager {
  static final _clientId = dotenv.env['CLIENT_ID'] ?? '';
  static final _clientSecret = dotenv.env['CLIENT_SECRETE'] ?? '';
  static const _redirectUri = 'http://localhost:3000/callback';
  static const _authEndpoint = 'https://accounts.spotify.com/authorize';
  static const _tokenEndpoint = 'https://accounts.spotify.com/api/token';

  String? _accessToken;
  String? _refreshToken;
  DateTime? _tokenExpiry;

  /// Initiates Spotify login and returns the user's profile information
  Future<Map<String, dynamic>?> login() async {
    final authCode = await _getAuthorizationCode();
    if (authCode != null) {
      await _exchangeToken(authCode);
      return await fetchUserProfile();
    }
    return null;
  }

  /// Step 1: Get Authorization Code
  Future<String?> _getAuthorizationCode() async {
    final authUrl = Uri.https('accounts.spotify.com', '/authorize', {
      'client_id': _clientId,
      'response_type': 'code',
      'redirect_uri': _redirectUri,
      'scope': 'user-read-private user-read-email',
    });

    try {
      final result = await FlutterWebAuth.authenticate(
        url: authUrl.toString(),
        callbackUrlScheme: 'http',
      );
      return Uri.parse(result).queryParameters['code'];
    } catch (e) {
      print('Error during authentication: $e');
      return null;
    }
  }

  /// Step 2: Exchange Authorization Code for Access Token
  Future<void> _exchangeToken(String code) async {
    final response = await http.post(
      Uri.parse(_tokenEndpoint),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': _redirectUri,
        'client_id': _clientId,
        'client_secret': _clientSecret,
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      _accessToken = jsonResponse['access_token'];
      _refreshToken = jsonResponse['refresh_token'];
      _tokenExpiry =
          DateTime.now().add(Duration(seconds: jsonResponse['expires_in']));
    } else {
      print('Failed to exchange token: ${response.statusCode}');
    }
  }

  /// Step 3: Refresh Access Token (if expired)
  Future<void> _refreshAccessToken() async {
    if (_refreshToken == null) return;

    final response = await http.post(
      Uri.parse(_tokenEndpoint),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'grant_type': 'refresh_token',
        'refresh_token': _refreshToken!,
        'client_id': _clientId,
        'client_secret': _clientSecret,
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      _accessToken = jsonResponse['access_token'];
      _tokenExpiry =
          DateTime.now().add(Duration(seconds: jsonResponse['expires_in']));
    } else {
      print('Failed to refresh token: ${response.statusCode}');
    }
  }

  /// Fetch user profile from Spotify API
  Future<Map<String, dynamic>?> fetchUserProfile() async {
    if (_accessToken == null) return null;

    if (_tokenExpiry != null && DateTime.now().isAfter(_tokenExpiry!)) {
      await _refreshAccessToken();
    }

    final response = await http.get(
      Uri.parse('https://api.spotify.com/v1/me'),
      headers: {
        'Authorization': 'Bearer $_accessToken',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Failed to fetch user profile: ${response.statusCode}');
      return null;
    }
  }

  /// Returns whether the user is currently logged in
  bool isLoggedIn() =>
      _accessToken != null && _tokenExpiry!.isAfter(DateTime.now());
}
