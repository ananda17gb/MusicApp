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
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            spreadRadius: 1,
            blurRadius: 15,
            blurStyle: BlurStyle.normal,
            offset: const Offset(0, 3),
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-5, -5),
            blurRadius: 15,
            spreadRadius: 1,
          )
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.grey.shade200,
            Colors.grey.shade300,
            Colors.grey.shade400,
            Colors.grey.shade500,
          ],
        ),
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
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    artistName,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade900,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // Wave Icon Effect
            isCurrentlyPlaying
                ? const WaveAnimationIcon(size: 32)
                : Icon(
                    Icons.play_circle,
                    color: Colors.grey.shade900,
                    size: 32,
                  ),
          ],
        ),
      ),
    );
  }
}

class WaveAnimationIcon extends StatefulWidget {
  final double size;
  const WaveAnimationIcon({super.key, this.size = 32});

  @override
  State<WaveAnimationIcon> createState() => _WaveAnimationIconState();
}

class _WaveAnimationIconState extends State<WaveAnimationIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
    _animation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: widget.size * _animation.value,
              height: widget.size * _animation.value,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade400.withOpacity(0.2),
              ),
            ),
            Icon(
              Icons.graphic_eq, // Use this to represent a wave effect
              color: Colors.grey.shade900,
              size: widget.size,
            ),
          ],
        );
      },
    );
  }
}
