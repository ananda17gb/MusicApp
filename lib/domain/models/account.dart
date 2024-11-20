import 'package:hive/hive.dart';
import 'package:music_app/domain/models/user.dart';

class AccountManager {
  late Box userBox;

  Future<void> init() async {
    userBox = await Hive.openBox('userBox');
  }

  void register(String username, String password) {
    if (userBox.containsKey(username)) {
      throw Exception("Username already exists");
    }
    String hashedPassword = _hashPassword(password);
    User newUser = User(username, hashedPassword);
    userBox.put(username, newUser.password);
  }

  bool login(String username, String password) {
    String? storedPassword = userBox.get(username);
    if (storedPassword == null) {
      return false; 
    }
    return storedPassword == _hashPassword(password);
  }

  String _hashPassword(String password) {
    return password.split('').reversed.join(); 
  }
}

