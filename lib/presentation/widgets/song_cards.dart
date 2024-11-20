import 'package:flutter/material.dart';

class SongsCards extends StatelessWidget {
  const SongsCards({super.key});

  void _playSongs() {
    print("Play Songs");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 72,
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey))),
        child: ElevatedButton(
            onPressed: _playSongs,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              elevation: 0,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.music_note,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ini judul",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      "Ini artis",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              ],
            )));
  }
}
