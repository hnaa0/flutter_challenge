import 'package:assignment_11/constants/colors.dart';
import 'package:assignment_11/constants/gaps.dart';
import 'package:assignment_11/constants/sizes.dart';
import 'package:assignment_11/features/auth/screens/create_account_signup_screen.dart';
import 'package:assignment_11/features/auth/models/user_data.dart';
import 'package:assignment_11/features/auth/widgets/app_bar.dart';
import 'package:assignment_11/features/auth/widgets/screen_title.dart';
import 'package:assignment_11/features/auth/widgets/wide_next_button.dart';
import 'package:flutter/material.dart';

class CustomizeExperienceScreen extends StatefulWidget {
  const CustomizeExperienceScreen({super.key, required this.userData});

  final UserData userData;

  @override
  State<CustomizeExperienceScreen> createState() =>
      _CustomizeExperienceScreenState();
}

class _CustomizeExperienceScreenState extends State<CustomizeExperienceScreen> {
  bool _switchValue = false;

  void _onSwitchChanged(bool value) {
    setState(() {
      _switchValue = value;
    });
  }

  void _onNextTap() {
    if (!_switchValue) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateAccountSignupScreen(
          userData: widget.userData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppBarWidget(
        leadingType: LeadingType.back,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size8,
            horizontal: Sizes.size28,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const ScreenTitle(title: "Customize your experience"),
                  Gaps.v24,
                  const Text(
                    "Track where you see Twitter content across the web",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: Sizes.size18,
                    ),
                  ),
                  Gaps.v8,
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Twitter uses this data to personalize your experience. This web browsing historty will never be stored with your name, email, or phone number.",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.size16,
                          ),
                          softWrap: true,
                        ),
                      ),
                      Gaps.h14,
                      Switch.adaptive(
                        value: _switchValue,
                        onChanged: (value) => _onSwitchChanged(value),
                        activeColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                  Gaps.v24,
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontFamily: "montserrat",
                        color: const Color(ThemeColors.black).withOpacity(0.7),
                        height: 1.5,
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
                        const TextSpan(
                            text:
                                ". Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy. "),
                        TextSpan(
                          text: "Learn more",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 80,
        color: const Color(ThemeColors.extraExtraLightGray),
        elevation: 0,
        child: GestureDetector(
          onTap: _onNextTap,
          child: WideNextButton(
            isValid: _switchValue,
          ),
        ),
      ),
    );
  }
}
