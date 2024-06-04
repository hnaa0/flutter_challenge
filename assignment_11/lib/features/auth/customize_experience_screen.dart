import 'package:assignment_11/constants/gaps.dart';
import 'package:assignment_11/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomizeExperienceScreen extends StatefulWidget {
  const CustomizeExperienceScreen({super.key});

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(
          FontAwesomeIcons.twitter,
          color: Theme.of(context).primaryColor,
          size: Sizes.size28,
        ),
        toolbarHeight: 80,
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
                  const Text(
                    "Customize your experience",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: Sizes.size28,
                    ),
                  ),
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
                        color: const Color(0xff14171A).withOpacity(0.7),
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
              Padding(
                padding: const EdgeInsets.only(
                  bottom: Sizes.size8,
                ),
                child: GestureDetector(
                  onTap: _onNextTap,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size16,
                      horizontal: Sizes.size28,
                    ),
                    decoration: BoxDecoration(
                      color: _switchValue
                          ? const Color(0xff14171A)
                          : const Color(0xffAAB8C2),
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
