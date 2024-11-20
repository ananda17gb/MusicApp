import 'package:flutter/material.dart';

class PlaylistCards extends StatelessWidget {
  const PlaylistCards({super.key});

  void _openPlaylist() {
    print("Open Playlist");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey))),
      child: ElevatedButton(
          onPressed: _openPlaylist,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            elevation: 0,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(8)),
          ),
          child: const Row(
            children: [
              Icon(Icons.featured_play_list, color: Colors.white),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ini nama playlist",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
