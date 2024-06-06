import 'package:assignment_11/constants/colors.dart';
import 'package:assignment_11/constants/gaps.dart';
import 'package:assignment_11/constants/sizes.dart';
import 'package:assignment_11/features/auth/create_account_screen.dart';
import 'package:assignment_11/features/auth/widgets/app_bar.dart';
import 'package:assignment_11/features/auth/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        leadingType: LeadingType.none,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size8,
              horizontal: Sizes.size28,
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: Sizes.size80),
                  child: Text(
                    textAlign: TextAlign.center,
                    "See what's happening in the world right now.",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: Sizes.size32,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SocialLoginButton(
                      icon: Icon(FontAwesomeIcons.google),
                    ),
                    Gaps.v12,
                    const SocialLoginButton(
                      icon: Icon(FontAwesomeIcons.github),
                    ),
                    Gaps.v20,
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Color(ThemeColors.lightGray),
                            thickness: 0.5,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Sizes.size14,
                          ),
                          child: Text(
                            "or",
                            style: TextStyle(
                              fontSize: Sizes.size12,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Color(ThemeColors.lightGray),
                            thickness: 0.5,
                          ),
                        ),
                      ],
                    ),
                    Gaps.v20,
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreateAccountScreen(),
                          ),
                        );
                      },
                      child: FractionallySizedBox(
                        widthFactor: 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: Sizes.size16,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(ThemeColors.black),
                            borderRadius: BorderRadius.circular(Sizes.size28),
                          ),
                          child: const Text(
                            textAlign: TextAlign.center,
                            "Create account",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Sizes.size16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gaps.v28,
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: "montserrat",
                          color:
                              const Color(ThemeColors.black).withOpacity(0.7),
                          fontSize: Sizes.size16,
                        ),
                        children: [
                          const TextSpan(
                              text: "By signning up, you agree to our "),
                          TextSpan(
                            text: "Terms",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const TextSpan(text: ", "),
                          TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const TextSpan(text: ", and "),
                          TextSpan(
                            text: "Cookie Use",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const TextSpan(text: "."),
                        ],
                      ),
                    ),
                    Gaps.v56,
                    Row(
                      children: [
                        Text(
                          "have an account already?",
                          style: TextStyle(
                            color:
                                const Color(ThemeColors.black).withOpacity(0.7),
                          ),
                        ),
                        Gaps.h6,
                        Text(
                          "Log in",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                    Gaps.v20,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
