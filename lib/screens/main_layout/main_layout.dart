import 'package:cineluxe/screens/home_screen/ui/home.dart';
import 'package:cineluxe/screens/profile_screen/ui/profile_details.dart';
import 'package:cineluxe/screens/search_screen/ui/search_screen.dart';
import 'package:cineluxe/utils/app_colors.dart';

import 'package:flutter/material.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_sizes.dart';
import '../browse_screen/ui/browse.dart';
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
    Browse(),
    ProfileDetails()
  ];

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Scaffold(
      backgroundColor: const Color(0xFF121212),

      body: Stack(
        children: [

          /// Screens
          IndexedStack(
            index: _currentIndex,
            children: _pages,
          ),

          /// Floating Bottom Navigation
          Positioned(
            left: width*0.02,
            right: width*0.02,
            bottom: height*0.01,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BottomNavigationBar(
                currentIndex: _currentIndex,

                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },

                elevation: 0,
                backgroundColor: const Color(0xFF282A28).withValues(alpha: 0.95),

                type: BottomNavigationBarType.fixed,

                selectedItemColor: AppColors.yellowColor,
                unselectedItemColor: Colors.grey,

                showSelectedLabels: false,
                showUnselectedLabels: false,

                items: const [
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(AppAssets.homeLogo),
                      size: 25,
                    ),
                    activeIcon: ImageIcon(
                      AssetImage(AppAssets.home1Logo),
                      size: 25,
                    ),
                    label: 'Home',
                  ),

                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(AppAssets.searchLogo),
                      size: 25,
                    ),
                    activeIcon: ImageIcon(
                      AssetImage(AppAssets.search1Logo),
                      size: 25,
                    ),
                    label: 'Search',
                  ),

                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(AppAssets.exploreLogo),
                      size: 25,
                    ),
                    activeIcon: ImageIcon(
                      AssetImage(AppAssets.explore1Logo),
                      size: 25,
                    ),
                    label: 'Browse',
                  ),

                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(AppAssets.profileLogo),
                      size: 25,
                    ),
                    activeIcon: ImageIcon(
                      AssetImage(AppAssets.profile1Logo),
                      size: 25,
                    ),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
