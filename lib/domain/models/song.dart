import 'package:music_app/domain/models/favorite.dart';
import 'package:music_app/domain/models/playlist.dart';

class Song {
    final String _title, _artist, _url;
    final int _duration;

    Song({
        required String artist, 
        required String title, 
        required String url, 
        required int duration
    })  : _artist = artist, _title = title, _duration = duration, _url = url;

    String get title => _title;
    String get artist => _artist;
    int get duration => _duration;
    String get url => _url;

    void addToPlaylist(Playlist playlist) {
        playlist.addSong(this);  
    }

    void removeFromPlaylist(Playlist playlist) {
        playlist.removeSong(this);  
    }

    void addToFavorite(Favorite favorite) {
        favorite.addSong(this);  
    }

    void removeFromFavorite(Favorite favorite) {
        favorite.removeSong(this);  
    }
}
