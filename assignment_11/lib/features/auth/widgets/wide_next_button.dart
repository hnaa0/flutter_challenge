import 'package:assignment_11/constants/colors.dart';
import 'package:assignment_11/constants/sizes.dart';
import 'package:flutter/material.dart';

class WideNextButton extends StatelessWidget {
  const WideNextButton({
    super.key,
    required this.isValid,
  });

  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.8,
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size16,
        horizontal: Sizes.size28,
      ),
      decoration: BoxDecoration(
        color: isValid
            ? const Color(ThemeColors.black)
            : const Color(ThemeColors.lightGray),
        borderRadius: BorderRadius.circular(Sizes.size28),
      ),
      child: const Text(
        "Next",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: Sizes.size18,
        ),
      ),
    );
  }
}
