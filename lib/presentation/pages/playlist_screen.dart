import 'package:flutter/material.dart';
import 'package:music_app/presentation/widgets/playlist_cards.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  final TextEditingController _searchController = TextEditingController();

  void _searchForPlaylist(String query) {
    // Handle search logic here (e.g., filter songs or make an API call)
    print('Searching for: $query');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Playlists",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _searchController,
              onChanged: _searchForPlaylist,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white54,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: "Find playlists",
                labelStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Color.fromARGB(95, 95, 95, 95),
                contentPadding: EdgeInsets.all(2.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(95, 95, 95, 95), width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(95, 95, 95, 95), width: 2.0)),
              ),
            ),
            const SizedBox(height: 10),
            const PlaylistCards(),
            const SizedBox(height: 10),
            const PlaylistCards(),
            const SizedBox(height: 10),
            const PlaylistCards(),
          ],
        ),
      ),
    );
  }
}
