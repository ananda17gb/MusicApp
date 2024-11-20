import 'package:music_app/domain/models/home.dart';
import 'package:music_app/domain/models/library.dart';
import 'package:music_app/domain/models/player.dart';
import 'package:music_app/domain/models/song.dart';
import 'package:music_app/domain/models/user.dart';

class Playlist {
    String name;
    List<Song> songs;
    User creator;
    int playCount;
    DateTime? lastPlayed;

    Playlist({required this.name,required this.creator, this.songs = const [], this.playCount = 0, this.lastPlayed});

    String get getName => name;
    User get getCreator => creator;
    List<Song> get getSongs => songs;

    void addSong(Song song){
        if (!songs.contains(song)){
            songs.add(song);
        }else{
            print("That song already in the playlist");
        }
    }

    void removeSong(Song song){
        if (!songs.contains(song)){
            print("That song doesn't exist in the playlist");
        }else{
            songs.remove(song);
        }
    }

    int getSongCount(){
        return songs.length;
    }

    void addToLibrary(Library library){
        if (!library.playlists.contains(this)){
            library.addPlaylist(this);
        }else{
            print("That playlist is already in the library.");
        }
    }

    void removeFromLibrary(Library library){
        if (!library.playlists.contains(this)){
           print("That playlist is not in the library."); 
        }else{
            library.removePlaylist(this);
        }
    } 

    void markAsPlayed(Home home) {
        playCount++;
        lastPlayed = DateTime.now();
        print("Playlist '$name' played at $lastPlayed.");
        home.addToRecentPlayedPlaylist(this);
    }

    Future<void> play(Player player, Home home) async {
        player.queue = songs;
        player.currentIndex = 0;
        await player.play();
        markAsPlayed(home);
    }
}
