import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size6,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(
              ThemeColors.lightGray,
            ).withOpacity(0.6),
          ),
          borderRadius: BorderRadius.circular(
            Sizes.size10,
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
