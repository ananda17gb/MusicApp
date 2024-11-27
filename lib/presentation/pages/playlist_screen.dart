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
              style: const TextStyle(color: Colors.black),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.black54),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Colors.black54),
                        onPressed: () {
                          _searchController.clear();
                          _searchForPlaylist('');
                        },
                      )
                    : null,
                hintText: "Find Playlist",
                hintStyle: const TextStyle(color: Colors.black54),
                filled: true,
                fillColor: const Color.fromARGB(255, 237, 237, 239), 
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
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
