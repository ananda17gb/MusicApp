import 'package:flutter/material.dart';

class PlayingBar extends StatelessWidget {
  final String songTitle;
  final String artistName;
  final bool isPlaying;
  final VoidCallback onPlayPause;
  final VoidCallback? onClose;
  final String albumArtUrl;

  const PlayingBar({
    super.key,
    required this.songTitle,
    required this.artistName,
    required this.isPlaying,
    required this.onPlayPause,
    this.onClose,
    this.albumArtUrl = 'https://via.placeholder.com/50',
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFE0E0E0), Color(0xFFBDBDBD)], // Grey gradient
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Subtle shadow
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // Album art or placeholder
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(albumArtUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),

            // Song details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    songTitle,
                    style: const TextStyle(
                      color: Colors.black, // Black text for song title
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    artistName,
                    style: const TextStyle(
                      color: Colors.black54, // Subtle black for artist name
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Play/Pause and Close buttons
            IconButton(
              icon: Icon(
                isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                color: Colors.black87, // Darker icon for contrast
                size: 40,
              ),
              onPressed: onPlayPause,
            ),
            IconButton(
              icon: const Icon(Icons.close, color: Colors.black54), // Close button with subtle color
              onPressed: onClose ?? onPlayPause,
            ),
          ],
        ),
      ),
    );
  }
}
