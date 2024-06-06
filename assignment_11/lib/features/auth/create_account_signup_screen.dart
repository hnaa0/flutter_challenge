import 'package:assignment_11/constants/colors.dart';
import 'package:assignment_11/constants/gaps.dart';
import 'package:assignment_11/constants/sizes.dart';
import 'package:assignment_11/features/auth/confirmation_code_screen.dart';
import 'package:assignment_11/features/auth/models/user_data.dart';
import 'package:assignment_11/features/auth/widgets/app_bar.dart';
import 'package:assignment_11/features/auth/widgets/field_check_mark.dart';
import 'package:assignment_11/features/auth/widgets/screen_title.dart';
import 'package:flutter/material.dart';

class CreateAccountSignupScreen extends StatelessWidget {
  const CreateAccountSignupScreen({
    super.key,
    required this.userData,
  });

  final UserData userData;

  void _onSignUpTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmationCodeScreen(
          userContact: userData.userContact,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ScreenTitle(title: "Create your account"),
                  Gaps.v6,
                  Form(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: Sizes.size6,
                          ),
                          child: TextFormField(
                            initialValue: userData.userName,
                            readOnly: true,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              label: Text(
                                "Name",
                                style: TextStyle(color: Colors.grey.shade800),
                              ),
                              suffixIcon: const FieldCheckMark(
                                valid: true,
                                switchKey: "name",
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(ThemeColors.lightGray),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: Sizes.size8),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: Sizes.size6,
                          ),
                          child: TextFormField(
                            initialValue: userData.userContact,
                            readOnly: true,
                            style: const TextStyle(
                              color: Color(ThemeColors.black),
                            ),
                            decoration: InputDecoration(
                              label: Text(
                                "Phone number or Email address",
                                style: TextStyle(color: Colors.grey.shade800),
                              ),
                              hintText: userData.userContact,
                              suffixIcon: const FieldCheckMark(
                                valid: true,
                                switchKey: "contact",
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(ThemeColors.lightGray),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: Sizes.size8),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: Sizes.size6,
                          ),
                          child: Column(
                            children: [
                              TextFormField(
                                initialValue: userData.userBirthday,
                                readOnly: true,
                                decoration: InputDecoration(
                                  label: Text(
                                    "Date of birth",
                                    style: TextStyle(
                                      color: Colors.grey.shade800,
                                    ),
                                  ),
                                  helperMaxLines: 4,
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(ThemeColors.lightGray),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  suffixIcon: const FieldCheckMark(
                                    valid: true,
                                    switchKey: "birthday",
                                  ),
                                  border: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(ThemeColors.lightGray),
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: Sizes.size8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: Sizes.size12,
                    ),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: "montserrat",
                          color:
                              const Color(ThemeColors.black).withOpacity(0.7),
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
                          const TextSpan(
                              text:
                                  ". Others will be able to find you by emial or phone number, when provided unless you choose otherwise"),
                          TextSpan(
                            text: " here",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => _onSignUpTap(context),
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.8,
                          padding: const EdgeInsets.symmetric(
                            vertical: Sizes.size16,
                            horizontal: Sizes.size28,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(ThemeColors.twitterBlue),
                            borderRadius: BorderRadius.circular(Sizes.size28),
                          ),
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: Sizes.size18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
