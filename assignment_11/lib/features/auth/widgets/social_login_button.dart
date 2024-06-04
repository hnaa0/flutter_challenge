import 'package:assignment_11/constants/sizes.dart';
import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.icon,
  });

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size16,
            horizontal: Sizes.size28,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: const Color(0xffAAB8C2),
            ),
            borderRadius: BorderRadius.circular(Sizes.size28),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: icon,
              ),
              const Text(
                "Continue with Google",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: Sizes.size16,
                ),
              ),
            ],
          ),
        ));
  }
}
