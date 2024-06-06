import 'package:assignment_11/constants/colors.dart';
import 'package:assignment_11/constants/gaps.dart';
import 'package:assignment_11/constants/sizes.dart';
import 'package:assignment_11/features/auth/widgets/screen_title.dart';
import 'package:flutter/material.dart';

class MainSubTextPack extends StatelessWidget {
  const MainSubTextPack({
    super.key,
    required this.main,
    required this.sub,
  });

  final String main;
  final String sub;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ScreenTitle(title: main),
        Gaps.v20,
        Text(
          sub,
          style: TextStyle(
            color: const Color(ThemeColors.black).withOpacity(0.7),
            fontSize: Sizes.size16,
          ),
        ),
      ],
    );
  }
}
