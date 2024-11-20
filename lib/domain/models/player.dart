import 'package:just_audio/just_audio.dart';
import 'package:music_app/domain/models/song.dart';

class Player {
  final AudioPlayer _audioPlayer = AudioPlayer(); 
  List<Song> queue; 
  int currentIndex; 
  bool isPlaying; 
  bool isShuffle; 
  bool isRepeat; 
  Duration currentTime; 
  Duration totalDuration; 

  Player({
    this.queue = const [],
    this.currentIndex = 0,
    this.isPlaying = false,
    this.isShuffle = false,
    this.isRepeat = false,
    this.currentTime = Duration.zero,
    this.totalDuration = Duration.zero,
  });

  Song? get currentSong => queue.isNotEmpty && currentIndex < queue.length ? queue[currentIndex] : null;

  Future<void> play() async {
    if (queue.isNotEmpty && currentIndex < queue.length) {
      final song = queue[currentIndex];
      await _audioPlayer.setUrl(song.url); 
      _audioPlayer.play();
      isPlaying = true;
      print('Playing: ${song.title}');
    }
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
    isPlaying = false;
    print('Paused: ${queue[currentIndex].title}');
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
    isPlaying = false;
    currentTime = Duration.zero;
    print('Stopped: ${queue[currentIndex].title}');
  }

  Future<void> resume() async {
    if (!isPlaying && queue.isNotEmpty && currentIndex < queue.length) {
      await _audioPlayer.play();
      isPlaying = true;
      print('Resumed: ${queue[currentIndex].title}');
    }
  }

  Future<void> next() async {
    if (isShuffle) {
      currentIndex = (currentIndex + 1) % queue.length; 
    } else {
      if (currentIndex < queue.length - 1) {
        currentIndex++;
      } else if (isRepeat) {
        currentIndex = 0; 
      }
    }
    await play();
  }

  Future<void> previous() async {
    if (currentIndex > 0) {
      currentIndex--;
    } else if (isRepeat) {
      currentIndex = queue.length - 1; 
    }
    await play();
  }

  void toggleShuffle() {
    isShuffle = !isShuffle;
    print(isShuffle ? 'Shuffle enabled' : 'Shuffle disabled');
  }

  void toggleRepeat() {
    isRepeat = !isRepeat;
    print(isRepeat ? 'Repeat enabled' : 'Repeat disabled');
  }

  void seek(Duration time) {
    if (time <= totalDuration) {
      _audioPlayer.seek(time);
      print('Seeked to $time');
    }
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}

