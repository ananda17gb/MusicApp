import 'package:flutter/material.dart';
import 'package:music_app/presentation/widgets/song_cards.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  void _searchForSongs(String query) {
    print('Searching for: $query');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Search",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold)),
            TextField(
              controller: _searchController,
              onChanged: _searchForSongs,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white54,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: "Find songs",
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
            const SongsCards(),
            const SizedBox(height: 10),
            const SongsCards(),
            const SizedBox(height: 10),
            const SongsCards(),
          ],
        ),
      ),
    );
  }
}
