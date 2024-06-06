import 'package:assignment_11/constants/sizes.dart';
import 'package:assignment_11/features/auth/widgets/app_bar.dart';
import 'package:assignment_11/features/auth/widgets/main_sub_text_pack.dart';

import 'package:flutter/material.dart';

class InterestsScreen extends StatelessWidget {
  const InterestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(
        leadingType: LeadingType.back,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Sizes.size8,
            horizontal: Sizes.size28,
          ),
          child: Column(
            children: [
              MainSubTextPack(
                main: "What do you want to see on Twitter?",
                sub:
                    "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
