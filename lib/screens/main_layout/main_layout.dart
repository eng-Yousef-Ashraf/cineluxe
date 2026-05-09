import 'package:cineluxe/screens/home_screen/ui/home.dart';
import 'package:cineluxe/screens/search_screen/ui/search_screen.dart';
import 'package:cineluxe/utils/app_colors.dart';

import 'package:flutter/material.dart';

import '../update_profile_screen/ui/Profile.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
     Home(),
    SearchScreen(),
    const Center(
      child: Text(
        'Browse Screen',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
    UpdateProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor:  Color(0xFF282A28),
          type: BottomNavigationBarType.fixed,
          selectedItemColor:  AppColors.yellowColor,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/home.png'),
              ),
              activeIcon: ImageIcon(
                AssetImage('assets/images/home1.png'),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/search.png'),
              ),
              activeIcon: ImageIcon(
                AssetImage('assets/images/search1.png'),
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              activeIcon: Icon(Icons.explore),
              label: 'Browse',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
