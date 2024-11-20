import 'package:music_app/domain/models/album.dart';
import 'package:music_app/domain/models/playlist.dart';
import 'package:music_app/domain/models/favorite.dart';

class Library {
    List<Playlist> playlists;  
    List<Album> albums;  
    Favorite favorites;  

    Library({this.playlists = const [], this.albums = const [], required this.favorites});

    List<Playlist> get getPlaylist => playlists;
    List<Album> get getAlbum => albums;
    Favorite get getFavorite => favorites;

    void addPlaylist(Playlist playlist){
        playlists.add(playlist);
    }

    void removePlaylist(Playlist playlist){
        playlists.remove(playlist);
    }

    void addAlbum(Album album){
        albums.add(album);
    }

    void removeAlbum(Album album){
        albums.add(album);
    }

    List<dynamic> searchByName(String name) {
        List<dynamic> results = [];
        results.addAll(albums.where((album) => album.name.contains(name)));
        results.addAll(playlists.where((playlist) => playlist.getName.contains(name)));
    return results;
  }
}
