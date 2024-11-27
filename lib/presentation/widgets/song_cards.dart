// import 'package:flutter/material.dart';

// class SongsCards extends StatefulWidget {
//   const SongsCards({super.key});

//   @override
//   State<SongsCards> createState() => _SongsCardsState();
// }

// class _SongsCardsState extends State<SongsCards> {
//   bool _isPlaying = false;

//   // Toggle play/pause
//   void _playSongs() {
//     setState(() {
//       _isPlaying = !_isPlaying;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8.0),
//       padding: const EdgeInsets.all(12.0),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade900,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             blurRadius: 6,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           GestureDetector(
//             onTap: _playSongs, // Toggle the playing bar when tapped
//             child: Row(
//               children: [
//                 // Song thumbnail
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: Image.network(
//                     'https://via.placeholder.com/60',
//                     width: 60,
//                     height: 60,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) {
//                       return Container(
//                         width: 60,
//                         height: 60,
//                         color: Colors.grey,
//                         child: const Icon(Icons.broken_image, color: Colors.white),
//                       );
//                     },
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 // Song title and artist
//                 const Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Song Title",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         "Artist Name",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.white70,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Icon(
//                   _isPlaying ? Icons.pause_circle : Icons.play_circle,
//                   color: Colors.white,
//                   size: 32,
//                 ),
//               ],
//             ),
//           ),
//           // Playing bar (visible only when _isPlaying is true)
//           if (_isPlaying)
//             Container(
//               margin: const EdgeInsets.only(top: 12),
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade800,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Row(
//                 children: [
//                   const Icon(Icons.music_note, color: Colors.white),
//                   const SizedBox(width: 8),
//                   const Expanded(
//                     child: Text(
//                       "Now Playing: Song Title",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 14,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: _playSongs, // Stop playing (pause)
//                     icon: const Icon(Icons.stop, color: Colors.red),
//                   ),
//                 ],
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class SongsCards extends StatelessWidget {
//   final VoidCallback? onPlay;
//   final String songTitle;
//   final String artistName;
//   final bool isCurrentlyPlaying;
//   final String albumArtUrl;

//   const SongsCards({
//     super.key, 
//     this.onPlay, 
//     this.songTitle = "Song Title", 
//     this.artistName = "Artist Name",
//     this.isCurrentlyPlaying = false,
//     this.albumArtUrl = 'https://via.placeholder.com/60',
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8.0),
//       padding: const EdgeInsets.all(12.0),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade900,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             blurRadius: 6,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: GestureDetector(
//         onTap: onPlay,
//         child: Row(
//           children: [
//             // Song thumbnail
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Image.network(
//                 albumArtUrl,
//                 width: 60,
//                 height: 60,
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) {
//                   return Container(
//                     width: 60,
//                     height: 60,
//                     color: Colors.grey,
//                     child: const Icon(Icons.broken_image, color: Colors.white),
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(width: 16),
//             // Song title and artist
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     songTitle,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     artistName,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       color: Colors.white70,
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ],
//               ),
//             ),
//             Icon(
//               isCurrentlyPlaying ? Icons.pause_circle : Icons.play_circle,
//               color: Colors.white,
//               size: 32,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class SongsCards extends StatelessWidget {
  final VoidCallback? onPlay;
  final String songTitle;
  final String artistName;
  final bool isCurrentlyPlaying;
  final String albumArtUrl;

  const SongsCards({
    super.key,
    this.onPlay,
    this.songTitle = "Song Title",
    this.artistName = "Artist Name",
    this.isCurrentlyPlaying = false,
    this.albumArtUrl = 'https://via.placeholder.com/60',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: onPlay,
        child: Row(
          children: [
            // Song thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                albumArtUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey,
                    child: const Icon(Icons.broken_image, color: Colors.white),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            // Song title and artist
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    songTitle,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    artistName,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(
              isCurrentlyPlaying ? Icons.pause_circle : Icons.play_circle,
              color: Colors.white,
              size: 32,
            ),
          ],
        ),
      ),
    );
  }
}
