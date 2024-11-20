import 'package:music_app/domain/models/home.dart';
import 'package:music_app/domain/models/library.dart';
import 'package:music_app/domain/models/player.dart';
import 'package:music_app/domain/models/song.dart';

class Album {
    final String name, artist;
    final List<Song> songs;
    int playCount;
    DateTime? lastPlayed;
    
    Album({required this.name, required this.artist,this.songs = const [], this.playCount = 0, this.lastPlayed});

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

    void markAsPlayed(Home home) {
        playCount++;
        lastPlayed = DateTime.now();
        print("Album '$name' played at $lastPlayed.");
        home.addToRecentPlayedAlbum(this);
    }

    Future<void> play(Player player, Home home) async {
        player.queue = songs;
        player.currentIndex = 0;
        await player.play();
        markAsPlayed(home);
    }
}
