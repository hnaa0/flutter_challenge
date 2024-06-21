import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/gaps.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _isPrivacy = false;

  void _onPrivacyTap(bool value) {
    setState(() {
      _isPrivacy = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Privacy",
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
        shape: const Border(
          bottom: BorderSide(
            color: Color(
              ThemeColors.extraLightGray,
            ),
            width: 1,
          ),
        ),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            splashRadius: 0,
            value: _isPrivacy,
            onChanged: (value) => _onPrivacyTap(value),
            title: const Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.lock,
                  size: Sizes.size20,
                  color: Color(ThemeColors.black),
                ),
                Gaps.h24,
                Text(
                  "Privacy",
                ),
              ],
            ),
          ),
          const ListTile(
            minLeadingWidth: 25,
            leading: FaIcon(
              FontAwesomeIcons.threads,
              size: Sizes.size20,
              color: Color(ThemeColors.black),
            ),
            title: Text(
              "Mentions",
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Everyone",
                  style: TextStyle(
                    fontSize: Sizes.size14,
                    color: Color(
                      ThemeColors.lightGray,
                    ),
                    height: 1.2,
                  ),
                ),
                Gaps.h6,
                FaIcon(
                  FontAwesomeIcons.angleRight,
                  size: Sizes.size20,
                  color: Color(
                    ThemeColors.lightGray,
                  ),
                ),
              ],
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.bellSlash,
              size: Sizes.size20,
              color: Color(ThemeColors.black),
            ),
            title: Text(
              "Muted",
            ),
            trailing: FaIcon(
              FontAwesomeIcons.angleRight,
              size: Sizes.size20,
              color: Color(
                ThemeColors.lightGray,
              ),
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.eyeSlash,
              size: Sizes.size20,
              color: Color(ThemeColors.black),
            ),
            title: Text(
              "Hidden Words",
            ),
            trailing: FaIcon(
              FontAwesomeIcons.angleRight,
              size: Sizes.size20,
              color: Color(
                ThemeColors.lightGray,
              ),
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.userGroup,
              size: Sizes.size20,
              color: Color(ThemeColors.black),
            ),
            title: Text(
              "Profiles you follow",
            ),
            trailing: FaIcon(
              FontAwesomeIcons.angleRight,
              size: Sizes.size20,
              color: Color(
                ThemeColors.lightGray,
              ),
            ),
          ),
          const ListTile(
            title: Text(
              "Other privacy settings",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              "Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram",
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Color(
                  ThemeColors.darkGray,
                ),
              ),
            ),
            trailing: FractionallySizedBox(
              heightFactor: 1.6,
              child: FaIcon(
                FontAwesomeIcons.arrowUpRightFromSquare,
                size: Sizes.size18,
                color: Color(
                  ThemeColors.lightGray,
                ),
              ),
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.circleXmark,
              size: Sizes.size20,
              color: Color(ThemeColors.black),
            ),
            title: Text(
              "Blocked profiles",
            ),
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              size: Sizes.size18,
              color: Color(
                ThemeColors.lightGray,
              ),
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.heartCircleXmark,
              size: Sizes.size20,
              color: Color(ThemeColors.black),
            ),
            title: Text(
              "Hide likes",
            ),
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              size: Sizes.size18,
              color: Color(
                ThemeColors.lightGray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
