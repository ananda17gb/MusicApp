import 'package:flutter/material.dart';
import 'package:music_app/presentation/pages/search_screen.dart';
import 'package:music_app/presentation/pages/home_screen.dart';
import 'package:music_app/presentation/pages/playlist_screen.dart';
import 'package:music_app/presentation/widgets/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const PlaylistScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.black,
              unselectedItemColor: Colors.white38,
              selectedItemColor: Colors.red)),
      home: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

