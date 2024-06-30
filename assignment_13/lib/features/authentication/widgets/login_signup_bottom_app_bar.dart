import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/gaps.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:flutter/material.dart';

class LoginSignupBottomAppBar extends StatelessWidget {
  const LoginSignupBottomAppBar({
    super.key,
    required this.onTapFunc,
    required this.buttonText,
  });

  final Function onTapFunc;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 90,
      color: const Color(ThemeColors.extraExtraLightGray),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => onTapFunc(),
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color(ThemeColors.extraExtraLightGray),
                borderRadius: BorderRadius.circular(Sizes.size4),
                border: Border.all(
                  color: const Color(ThemeColors.lightGray),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size6,
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Gaps.v12,
          Image.asset(
            "assets/images/meta_logo.png",
            width: 55,
          ),
        ],
      ),
    );
  }
}
