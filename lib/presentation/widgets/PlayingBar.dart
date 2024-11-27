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
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
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
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    artistName,
                    style: const TextStyle(
                      color: Colors.white70,
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
                color: Colors.white,
                size: 40,
              ),
              onPressed: onPlayPause,
            ),
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white70),
              onPressed: onClose ?? onPlayPause,
            ),
          ],
        ),
      ),
    );
  }
}