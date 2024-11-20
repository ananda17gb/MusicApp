import 'package:music_app/domain/models/playlist.dart';
import 'package:music_app/domain/models/song.dart';
import 'package:music_app/domain/models/album.dart';
import 'package:music_app/domain/models/artist.dart';

class Search {
  Artist? searchArtist(List<Artist> artists, String artistName) {
    if (artistName.isEmpty) {
      return null;
    }
    try {
      return artists.firstWhere(
        (artist) => artist.name.toLowerCase().contains(artistName.toLowerCase()),
      );
    } catch (e) {
      return null; // Return null if no artist is found
    }
  }

  List<Playlist> searchPlaylists(List<Playlist> playlists, String query) {
    if (query.isEmpty) {
      return [];
    }
    return playlists
        .where((playlist) => playlist.getName.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  List<Song> searchSongs(List<Song> songs, String query) {
    if (query.isEmpty) {
      return [];
    }
    return songs
        .where((song) => song.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  List<Album> searchAlbums(List<Album> albums, String query) {
    if (query.isEmpty) {
      return [];
    }
    return albums
        .where((album) => album.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  List<dynamic> searchAll(
    List<Artist> artists, 
    List<Playlist> playlists, 
    List<Song> songs, 
    List<Album> albums, 
    String query
  ) {
    if (query.isEmpty) {
      return [];
    }

    List<dynamic> results = [];

    results.addAll(searchArtist(artists, query) != null ? [searchArtist(artists, query)] : []);
    results.addAll(searchPlaylists(playlists, query));
    results.addAll(searchSongs(songs, query));
    results.addAll(searchAlbums(albums, query));

    return results.isNotEmpty ? results : [];
  }
}

