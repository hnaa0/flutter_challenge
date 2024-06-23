import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/utils.dart';
import 'package:flutter/material.dart';

class WriteThreadBottomAppBar extends StatelessWidget {
  const WriteThreadBottomAppBar({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 50,
      elevation: 0,
      color:
          isDarkMode(context) ? const Color(ThemeColors.black) : Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Anyone can reply",
            style: TextStyle(
              color: Color(
                ThemeColors.lightGray,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              "Post",
              style: TextStyle(
                color: const Color(
                  ThemeColors.twitterBlue,
                ).withOpacity(text != "" ? 1 : 0.5),
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
