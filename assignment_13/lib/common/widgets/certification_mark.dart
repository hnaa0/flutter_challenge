import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CertificationMark extends StatelessWidget {
  const CertificationMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: Sizes.size14,
      height: Sizes.size14,
      decoration: BoxDecoration(
        color: const Color(
          ThemeColors.twitterBlue,
        ),
        borderRadius: BorderRadius.circular(
          Sizes.size20,
        ),
      ),
      child: const FaIcon(
        FontAwesomeIcons.check,
        size: Sizes.size8,
        color: Colors.white,
      ),
    );
  }
}
