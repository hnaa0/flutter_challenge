import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/gaps.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/features/settings/privacy_screen.dart';
import 'package:assignment_13/utils.dart';
import 'package:flutter/cupertino.dart';
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
                  fontSize: Sizes.size16,
                ),
              ),
            ],
          ),
        ),
        leadingWidth: 80,
        shape: Border(
          bottom: BorderSide(
            color: isDarkMode(context)
                ? const Color(ThemeColors.darkGray)
                : const Color(
                    ThemeColors.extraLightGray,
                  ),
            width: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.userPlus,
                size: Sizes.size20,
                color: isDarkMode(context)
                    ? const Color(ThemeColors.extraExtraLightGray)
                    : const Color(ThemeColors.black),
              ),
              title: const Text(
                "Follow and invite friends",
              ),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.bell,
                size: Sizes.size20,
                color: isDarkMode(context)
                    ? const Color(ThemeColors.extraExtraLightGray)
                    : const Color(ThemeColors.black),
              ),
              title: const Text(
                "Notifications",
              ),
            ),
            ListTile(
              onTap: () => _onPrivacyTap(context),
              leading: FaIcon(
                FontAwesomeIcons.lock,
                size: Sizes.size20,
                color: isDarkMode(context)
                    ? const Color(ThemeColors.extraExtraLightGray)
                    : const Color(ThemeColors.black),
              ),
              title: const Text(
                "Privacy",
              ),
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.user,
                size: Sizes.size20,
                color: isDarkMode(context)
                    ? const Color(ThemeColors.extraExtraLightGray)
                    : const Color(ThemeColors.black),
              ),
              title: const Text(
                "Account",
              ),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.hand,
                size: Sizes.size20,
                color: isDarkMode(context)
                    ? const Color(ThemeColors.extraExtraLightGray)
                    : const Color(ThemeColors.black),
              ),
              title: const Text(
                "Help",
              ),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.circleInfo,
                size: Sizes.size20,
                color: isDarkMode(context)
                    ? const Color(ThemeColors.extraExtraLightGray)
                    : const Color(ThemeColors.black),
              ),
              title: const Text(
                "About",
              ),
            ),
            ListTile(
              onTap: () {
                showAdaptiveDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog.adaptive(
                      elevation: 0,
                      title: const Text(
                        "Would you like to log out of the Threads?",
                        style: TextStyle(
                          fontSize: Sizes.size18,
                        ),
                      ),
                      actions: [
                        Column(
                          children: [
                            FractionallySizedBox(
                              widthFactor: 1,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Log out",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: Sizes.size16,
                                  ),
                                ),
                              ),
                            ),
                            FractionallySizedBox(
                              widthFactor: 1,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                    fontSize: Sizes.size16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              title: const Text(
                "Log out",
                style: TextStyle(
                  color: Color(
                    ThemeColors.twitterBlue,
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: const Text(
                        "Would you like to log out of the Threads?",
                        style: TextStyle(
                          fontSize: Sizes.size18,
                        ),
                      ),
                      actions: [
                        CupertinoDialogAction(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Log out",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: Sizes.size16,
                            ),
                          ),
                        ),
                        CupertinoDialogAction(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                              fontSize: Sizes.size16,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              title: const Text(
                "Log out (IOS)",
                style: TextStyle(
                  color: Color(
                    ThemeColors.twitterBlue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
