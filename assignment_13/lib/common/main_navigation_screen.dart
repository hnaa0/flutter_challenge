import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/home_screen.dart';
import 'package:assignment_13/notifications_screen.dart';
import 'package:assignment_13/profile_screen.dart';
import 'package:assignment_13/search_screen.dart';
import 'package:assignment_13/write_thread_screen.dart';
import 'package:flutter/material.dart';
import 'package:assignment_13/common/widgets/nav_tab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIdx = 0;

  void _onNavTap(int idx) {
    setState(() {
      _selectedIdx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIdx != 0,
            child: const HomeScreen(),
          ),
          Offstage(
            offstage: _selectedIdx != 1,
            child: const SearchScreen(),
          ),
          Offstage(
            offstage: _selectedIdx != 2,
            child: const WriteThreadScreen(),
          ),
          Offstage(
            offstage: _selectedIdx != 3,
            child: const NotificationsScreen(),
          ),
          Offstage(
            offstage: _selectedIdx != 4,
            child: const ProfileScreen(),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
        child: Row(
          children: [
            NavTab(
              icon: FontAwesomeIcons.house,
              isSelected: _selectedIdx == 0 ? true : false,
              onTap: () => _onNavTap(0),
            ),
            NavTab(
              icon: FontAwesomeIcons.magnifyingGlass,
              isSelected: _selectedIdx == 1 ? true : false,
              onTap: () => _onNavTap(1),
            ),
            NavTab(
              icon: FontAwesomeIcons.pen,
              isSelected: _selectedIdx == 2 ? true : false,
              onTap: () => _onNavTap(2),
            ),
            NavTab(
              icon: FontAwesomeIcons.solidHeart,
              isSelected: _selectedIdx == 3 ? true : false,
              onTap: () => _onNavTap(3),
            ),
            NavTab(
              icon: FontAwesomeIcons.user,
              isSelected: _selectedIdx == 4 ? true : false,
              onTap: () => _onNavTap(4),
            ),
          ],
        ),
      ),
    );
  }
}
