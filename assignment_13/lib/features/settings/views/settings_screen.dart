import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/gaps.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/features/settings/view_models/theme_mode_view_model.dart';
import 'package:assignment_13/features/settings/views/privacy_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  static const routeUrl = "/settings";
  static const routeName = "settings";

  const SettingsScreen({super.key});

  void _onPrivacyTap(BuildContext context) {
    context.pushNamed(PrivacyScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<SettingsThemeModeViewModel>().darkMode;
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
            color: isDark
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
            SwitchListTile.adaptive(
              splashRadius: 0,
              value: isDark,
              onChanged: (value) {
                context
                    .read<SettingsThemeModeViewModel>()
                    .toggleThemeMode(value);
              },
              title: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.moon,
                    size: Sizes.size20,
                    color: isDark
                        ? const Color(ThemeColors.extraExtraLightGray)
                        : const Color(ThemeColors.black),
                  ),
                  Gaps.h24,
                  const Text(
                    "Dark mode",
                  ),
                ],
              ),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.userPlus,
                size: Sizes.size20,
                color: isDark
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
                color: isDark
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
                color: isDark
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
                color: isDark
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
                color: isDark
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
                color: isDark
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
