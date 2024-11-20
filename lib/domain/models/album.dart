import 'package:music_app/domain/models/library.dart';
import 'package:music_app/domain/models/song.dart';

class Album {
    String name, artist;
    List<Song> songs;
    
    Album({required this.name, required this.artist,this.songs = const []});

    void addToLibrary(Library library){
        if (!library.albums.contains(this)){
            library.addAlbum(this);
        }else{
            print("That albums is already in the library.");
        }
    }

    void removeFromLibrary(Library library){
        if (!library.albums.contains(this)){
           print("That album is not in the library."); 
        }else{
            library.removeAlbum(this);
        }
    }
}
