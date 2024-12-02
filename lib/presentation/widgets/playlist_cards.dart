import 'package:flutter/material.dart';

class PlaylistCards extends StatelessWidget {
  const PlaylistCards({super.key});

  void _openPlaylist() {
    print("Open Playlist");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0), // Vertical margin for spacing
      padding: const EdgeInsets.all(12.0), // Padding inside the card
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            spreadRadius: 1,
            blurRadius: 15,
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
      child: InkWell(
        onTap: _openPlaylist,
        borderRadius: BorderRadius.circular(12), // Ensures ripple effect matches the border radius
        child: const Row(
          children: [
            // Icon for Playlist (without box decoration)
            Icon(Icons.featured_play_list, size: 50, color: Colors.black),
            SizedBox(width: 20), // Spacing between icon and text

            // Playlist Name
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ini nama playlist",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "0 Song",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
