import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/gaps.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/features/settings/privacy_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _onPrivacyTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PrivacyScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.pop(context);
          },
          child: const Row(
            children: [
              Gaps.h16,
              FaIcon(
                FontAwesomeIcons.angleLeft,
                size: Sizes.size20,
              ),
              Gaps.h8,
              Text(
                "Back",
                style: TextStyle(
                  fontSize: Sizes.size18,
                ),
              ),
            ],
          ),
        ),
        leadingWidth: 80,
        shape: const Border(
          bottom: BorderSide(
            color: Color(
              ThemeColors.extraLightGray,
            ),
            width: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const ListTile(
              leading: FaIcon(
                FontAwesomeIcons.userPlus,
                size: Sizes.size20,
                color: Color(ThemeColors.black),
              ),
              title: Text(
                "Follow and invite friends",
              ),
            ),
            const ListTile(
              leading: FaIcon(
                FontAwesomeIcons.bell,
                size: Sizes.size20,
                color: Color(ThemeColors.black),
              ),
              title: Text(
                "Notifications",
              ),
            ),
            ListTile(
              onTap: () => _onPrivacyTap(context),
              leading: const FaIcon(
                FontAwesomeIcons.lock,
                size: Sizes.size20,
                color: Color(ThemeColors.black),
              ),
              title: const Text(
                "Privacy",
              ),
            ),
            const ListTile(
              leading: Icon(
                FontAwesomeIcons.user,
                size: Sizes.size20,
                color: Color(ThemeColors.black),
              ),
              title: Text(
                "Account",
              ),
            ),
            const ListTile(
              leading: FaIcon(
                FontAwesomeIcons.hand,
                size: Sizes.size20,
                color: Color(ThemeColors.black),
              ),
              title: Text(
                "Help",
              ),
            ),
            const ListTile(
              leading: FaIcon(
                FontAwesomeIcons.circleInfo,
                size: Sizes.size20,
                color: Color(ThemeColors.black),
              ),
              title: Text(
                "About",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
