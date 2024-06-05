import 'package:assignment_11/constants/sizes.dart';
import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: Sizes.size28,
      ),
    );
  }
}
