import 'package:assignment_11/constants/colors.dart';
import 'package:assignment_11/constants/sizes.dart';
import 'package:flutter/material.dart';

class HorizontalScrollCard extends StatelessWidget {
  const HorizontalScrollCard({
    super.key,
    required this.text,
    required this.isSelected,
  });

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size20,
        vertical: Sizes.size12,
      ),
      decoration: BoxDecoration(
        color: isSelected ? const Color(ThemeColors.twitterBlue) : null,
        border: Border.all(
          color: const Color(ThemeColors.lightGray).withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(
          Sizes.size28,
        ),
      ),
      child: Text(
        softWrap: false,
        text,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: isSelected ? Colors.white : null,
        ),
      ),
    );
  }
}
