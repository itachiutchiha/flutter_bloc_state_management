import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:state_management_learn/features/character/presentation/screens/charactere_screen.dart';
import 'package:state_management_learn/features/seach/presentation/screens/search_screen.dart';
import 'package:state_management_learn/profile_screen.dart';
import 'package:state_management_learn/saved_characters_screen.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage();

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> screens = const [
    CharactereScreen(),
    SearchScreen(),
    SavedCharactersScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121214),
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: _buildCustomBottomNavBar(),
    );
  }

  // 2. The Custom Bottom Navigation Bar Design
  Widget _buildCustomBottomNavBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(
          16, 0, 16, 20), // Makes it float elegantly above the bottom edge
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          // Applies a premium frosted glass effect over content scrolling underneath
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: const Color(0xFF1A1A1E)
                .withOpacity(0.85), // Matches card colors with opacity
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,

              // Styling Configuration
              backgroundColor:
                  Colors.transparent, // Required for BackdropFilter to work
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              showSelectedLabels: true,
              showUnselectedLabels: true,

              // Colors matching the Character theme
              selectedItemColor: Colors.amber,
              unselectedItemColor: Colors.grey[500],
              selectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              unselectedLabelStyle: const TextStyle(fontSize: 10),

              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.movie_outlined),
                  activeIcon: Icon(Icons.movie, color: Colors.amber),
                  label: 'Characters',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people_outline),
                  activeIcon: Icon(Icons.people, color: Colors.amber),
                  label: 'search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark_border),
                  activeIcon: Icon(Icons.bookmark, color: Colors.amber),
                  label: 'Saved',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person, color: Colors.amber),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
