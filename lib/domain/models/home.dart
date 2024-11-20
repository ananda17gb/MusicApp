import 'package:music_app/domain/models/playlist.dart';
import 'package:music_app/domain/models/album.dart';

class Home {
  List<Playlist> featuredPlaylists;
  List<Playlist> recentPlayedPlaylists;
  List<Album> recentPlayedAlbums;

  Home({
    this.featuredPlaylists = const [],
    this.recentPlayedPlaylists = const [],
    this.recentPlayedAlbums = const [],
  });

  void addToRecentPlayedAlbum(Album album) {
    if (!recentPlayedAlbums.contains(album)) {
      recentPlayedAlbums.add(album);
    }
    // Sort by lastPlayed date (most recent first)
    recentPlayedAlbums.sort((a, b) => b.lastPlayed?.compareTo(a.lastPlayed ?? DateTime(1970, 1, 1)) ?? 0);
  }

  // Add playlist to recent played (could be called in Player class when a playlist is played)
  void addToRecentPlayedPlaylist(Playlist playlist) {
    if (!recentPlayedPlaylists.contains(playlist)) {
      recentPlayedPlaylists.add(playlist);
    }
    // Sort by lastPlayed date (most recent first)
    recentPlayedPlaylists.sort((a, b) => b.lastPlayed?.compareTo(a.lastPlayed ?? DateTime(1970, 1, 1)) ?? 0);
  }

  // Method to get recently played albums (if you want to display them in reverse order)
  List<Album> getRecentPlayedAlbums() {
    return recentPlayedAlbums.take(5).toList(); // Display top 5 recent albums
  }

  // Method to get recently played playlists (if you want to display them in reverse order)
  List<Playlist> getRecentPlayedPlaylists() {
    return recentPlayedPlaylists.take(5).toList(); // Display top 5 recent playlists
  }
}

