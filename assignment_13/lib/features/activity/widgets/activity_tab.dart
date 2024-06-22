import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/utils.dart';
import 'package:flutter/material.dart';

class ActivityTab extends StatelessWidget {
  const ActivityTab({
    super.key,
    required this.text,
    required this.isSelected,
  });

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      alignment: Alignment.center,
      width: 110,
      decoration: BoxDecoration(
        // color: isSelected ? const Color(ThemeColors.black) : Colors.white,
        color: isDarkMode(context)
            ? isSelected
                ? const Color(ThemeColors.darkGray)
                : const Color(ThemeColors.extraLightGray)
            : isSelected
                ? Colors.black
                : Colors.white,
        border: !isSelected
            ? Border.all(
                color: const Color(
                  ThemeColors.extraLightGray,
                ),
              )
            : null,
        borderRadius: BorderRadius.circular(
          Sizes.size10,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: Sizes.size16,
        ),
      ),
    );
  }
}
