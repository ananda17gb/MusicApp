// import 'package:flutter/material.dart';
// import 'package:music_app/presentation/widgets/song_cards.dart';
// import 'package:music_app/presentation/widgets/PlayingBar.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   final TextEditingController _searchController = TextEditingController();

//   void _searchForSongs(String query) {
//     print('Searching for: $query');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text("Search",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold)),
//            TextField(
//               controller: _searchController,
//               onChanged: _searchForSongs,
//               style: const TextStyle(color: Colors.black),
//               cursorColor: Colors.black,
//               decoration: InputDecoration(
//                 prefixIcon: const Icon(Icons.search, color: Colors.black54),
//                 suffixIcon: _searchController.text.isNotEmpty
//                     ? IconButton(
//                         icon: const Icon(Icons.clear, color: Colors.black54),
//                         onPressed: () {
//                           _searchController.clear();
//                           _searchForSongs('');
//                         },
//                       )
//                     : null,
//                 hintText: "Find songs",
//                 hintStyle: const TextStyle(color: Colors.black54),
//                 filled: true,
//                 fillColor: const Color.fromARGB(255, 237, 237, 239), 
//                 contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                   borderSide: const BorderSide(color: Colors.transparent),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                   borderSide: const BorderSide(color: Colors.transparent),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             const SongsCards(),
//             const SizedBox(height: 10),
//             const SongsCards(),
//             const SizedBox(height: 10),
//             const SongsCards(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// 1ST DESIGN
// import 'package:flutter/material.dart';
// import 'package:music_app/presentation/widgets/song_cards.dart';
// import 'package:music_app/presentation/widgets/PlayingBar.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   bool _isSongSelected = false; // Flag to track if a song is selected
//   bool _isPlaying = false;
//   String _currentSongTitle = "Song Title";
//   String _currentArtistName = "Artist Name";
//   String _currentSongId = ""; // Track the current song ID to manage play state

//   // Method to start playing a song
//   void _playSong(String title, String artist, String songId) {
//     setState(() {
//       if (_currentSongId == songId) {
//         _isPlaying = !_isPlaying; // Toggle play/pause if the same song is tapped
//       } else {
//         _isPlaying = true; // Play the new song
//       }
//       _currentSongTitle = title;
//       _currentArtistName = artist;
//       _currentSongId = songId;
//       _isSongSelected = true; // Mark a song as selected
//     });
//   }

//   // Toggle play/pause for PlayingBar
//   void _togglePlayPause() {
//     setState(() {
//       _isPlaying = !_isPlaying;
//     });
//   }

//   // Handle song search input
//   void _searchForSongs(String query) {
//     print('Searching for: $query');
//     // Implement actual search logic here
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text(
//           'Search',
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Search",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             TextField(
//               controller: _searchController,
//               onChanged: _searchForSongs,
//               style: const TextStyle(color: Colors.black),
//               cursorColor: Colors.black,
//               decoration: InputDecoration(
//                 prefixIcon: const Icon(Icons.search, color: Colors.black54),
//                 suffixIcon: _searchController.text.isNotEmpty
//                     ? IconButton(
//                         icon: const Icon(Icons.clear, color: Colors.black54),
//                         onPressed: () {
//                           _searchController.clear();
//                           _searchForSongs('');
//                         },
//                       )
//                     : null,
//                 hintText: "Find songs",
//                 hintStyle: const TextStyle(color: Colors.black54),
//                 filled: true,
//                 fillColor: const Color.fromARGB(255, 237, 237, 239),
//                 contentPadding: const EdgeInsets.symmetric(
//                     vertical: 10.0, horizontal: 20.0),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                   borderSide: const BorderSide(color: Colors.transparent),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                   borderSide: const BorderSide(color: Colors.transparent),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             // Songs List
//             SongsCards(
//               songTitle: "Song 1",
//               artistName: "Artist 1",
//               isCurrentlyPlaying: _currentSongId == "song1",
//               onPlay: () => _playSong("Song 1", "Artist 1", "song1"),
//             ),
//             const SizedBox(height: 10),
//             SongsCards(
//               songTitle: "Song 2",
//               artistName: "Artist 2",
//               isCurrentlyPlaying: _currentSongId == "song2",
//               onPlay: () => _playSong("Song 2", "Artist 2", "song2"),
//             ),
//             const SizedBox(height: 10),
//             SongsCards(
//               songTitle: "Song 3",
//               artistName: "Artist 3",
//               isCurrentlyPlaying: _currentSongId == "song3",
//               onPlay: () => _playSong("Song 3", "Artist 3", "song3"),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Visibility(
//         visible: _isSongSelected, // Only show PlayingBar when a song is selected
//         child: PlayingBar(
//           songTitle: _currentSongTitle,
//           artistName: _currentArtistName,
//           isPlaying: _isPlaying,
//           onPlayPause: _togglePlayPause, // Pass the toggle function here
//           onClose: () {
//             setState(() {
//               _isSongSelected = false;
//               _isPlaying = false;
//               _currentSongTitle = "Song Title";
//               _currentArtistName = "Artist Name";
//               _currentSongId = ""; // Reset current song ID
//             });
//           },
//         ),
//       ),
//     );
//   }
// }

//2 DESIGN
import 'package:flutter/material.dart';
import 'package:music_app/presentation/widgets/song_cards.dart';
import 'package:music_app/presentation/widgets/PlayingBar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSongSelected = false;
  bool _isPlaying = false;
  String _currentSongTitle = "Song Title";
  String _currentArtistName = "Artist Name";
  String _currentSongId = "";

  void _playSong(String title, String artist, String songId) {
    setState(() {
      if (_currentSongId == songId) {
        _isPlaying = !_isPlaying;
      } else {
        _isPlaying = true;
      }
      _currentSongTitle = title;
      _currentArtistName = artist;
      _currentSongId = songId;
      _isSongSelected = true;
    });
  }

  void _togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  void _searchForSongs(String query) {
    print('Searching for: $query');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.cyan],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text(
          'Local',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(30),
              child: TextField(
                controller: _searchController,
                onChanged: _searchForSongs,
                style: const TextStyle(color: Colors.black),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, color: Colors.grey),
                          onPressed: () {
                            _searchController.clear();
                            _searchForSongs('');
                          },
                        )
                      : null,
                  hintText: "Find Local Music.",
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 20.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Song List Header
            // const Text(
            //   "Popular Songs",
            //   style: TextStyle(
            //     color: Colors.black,
            //     fontSize: 18,
            //     fontWeight: FontWeight.w600,
            //   ),
            // ),
            const SizedBox(height: 10),
            // Songs List
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  SongsCards(
                    songTitle: "Song 1",
                    artistName: "Artist 1",
                    isCurrentlyPlaying: _currentSongId == "song1",
                    onPlay: () => _playSong("Song 1", "Artist 1", "song1"),
                  ),
                  const SizedBox(height: 10),
                  SongsCards(
                    songTitle: "Song 2",
                    artistName: "Artist 2",
                    isCurrentlyPlaying: _currentSongId == "song2",
                    onPlay: () => _playSong("Song 2", "Artist 2", "song2"),
                  ),
                  const SizedBox(height: 10),
                  SongsCards(
                    songTitle: "Song 3",
                    artistName: "Artist 3",
                    isCurrentlyPlaying: _currentSongId == "song3",
                    onPlay: () => _playSong("Song 3", "Artist 3", "song3"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: _isSongSelected,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: PlayingBar(
            songTitle: _currentSongTitle,
            artistName: _currentArtistName,
            isPlaying: _isPlaying,
            onPlayPause: _togglePlayPause,
            onClose: () {
              setState(() {
                _isSongSelected = false;
                _isPlaying = false;
                _currentSongTitle = "Song Title";
                _currentArtistName = "Artist Name";
                _currentSongId = "";
              });
            },
          ),
        ),
      ),
    );
  }
}
