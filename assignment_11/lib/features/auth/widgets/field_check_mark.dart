import 'package:assignment_11/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FieldCheckMark extends StatelessWidget {
  const FieldCheckMark({
    super.key,
    required this.valid,
    required this.switchKey,
  });

  final bool valid;
  final String switchKey;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 150),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: valid
          ? Container(
              key: ValueKey<String>(switchKey),
              width: Sizes.size32,
              height: Sizes.size32,
              decoration: BoxDecoration(
                color: const Color(0xff41B06E),
                borderRadius: BorderRadius.circular(
                  Sizes.size28,
                ),
              ),
              child: const Icon(
                FontAwesomeIcons.check,
                color: Colors.white,
                size: Sizes.size18,
              ),
            )
          : null,
    );
  }
}
