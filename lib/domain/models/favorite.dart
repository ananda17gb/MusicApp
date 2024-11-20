import 'package:music_app/domain/models/playlist.dart';

class Favorite extends Playlist{
    Favorite({required super.creator, super.songs = const []})
      : super(name: 'Favorite');
}
