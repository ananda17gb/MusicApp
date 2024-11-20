import 'package:music_app/domain/models/album.dart';
import 'package:music_app/domain/models/song.dart';

class Artist {
    final String _name;
    String _bio;
    List<Album> albums;
    List<Song> songs;

    Artist({
        required String name,
        String bio = "",
        this.albums = const [],
        this.songs = const [],
    })  : _name = name, _bio = bio;

    String get name => _name;
    String get bio => _bio;
    set bio(String newBio) => _bio = newBio;
    List<Album> get getAlbums => albums;
    List<Song> get getSongs => songs;
}
