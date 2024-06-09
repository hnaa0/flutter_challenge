import 'package:assignment_11/constants/colors.dart';
import 'package:assignment_11/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VerticalScrollCard extends StatelessWidget {
  const VerticalScrollCard({
    super.key,
    required this.text,
    required this.isSelected,
  });

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size8,
            horizontal: Sizes.size14,
          ),
          decoration: BoxDecoration(
            color: isSelected ? const Color(ThemeColors.twitterBlue) : null,
            borderRadius: BorderRadius.circular(
              Sizes.size18,
            ),
            border: Border.all(
              color: const Color(ThemeColors.lightGray).withOpacity(0.5),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: Sizes.size16,
              color: isSelected ? Colors.white : null,
            ),
          ),
        ),
        isSelected
            ? Positioned(
                top: Sizes.size12,
                right: Sizes.size12,
                child: Container(
                  width: Sizes.size18,
                  height: Sizes.size18,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      Sizes.size20,
                    ),
                  ),
                  child: const Icon(
                    FontAwesomeIcons.check,
                    size: Sizes.size10,
                    color: Color(ThemeColors.twitterBlue),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
