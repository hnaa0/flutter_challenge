import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/gaps.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/features/authentication/views/signup_screen.dart';
import 'package:assignment_13/features/authentication/widgets/login_signup_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  static const routeUrl = "/";
  static const routeName = "login";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void _onNewAccountTap() {
    FocusScope.of(context).unfocus();
    context.pushNamed(SignupScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(ThemeColors.extraExtraLightGray),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size16,
              ),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: Image.asset(
                        "assets/images/threads_logo.png",
                        width: 75,
                      ),
                    ),
                    SizedBox(
                      height: 400,
                      child: Column(
                        children: [
                          Form(
                            key: _formKey,
                            onChanged: () {},
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: Sizes.size10,
                                      vertical: Sizes.size16,
                                    ),
                                    hintText: "Mobile number or email",
                                    hintStyle: TextStyle(
                                      color: Color(
                                        ThemeColors.lightGray,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(
                                          ThemeColors.lightGray,
                                        ),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(
                                          ThemeColors.lightBlue,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Gaps.v14,
                                TextFormField(
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: Sizes.size10,
                                      vertical: Sizes.size18,
                                    ),
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                      color: Color(
                                        ThemeColors.lightGray,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(
                                          ThemeColors.lightGray,
                                        ),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(
                                          ThemeColors.lightBlue,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gaps.v14,
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: const Color(ThemeColors.deepBlue),
                              borderRadius: BorderRadius.circular(Sizes.size4),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Sizes.size14,
                              ),
                              child: Text(
                                "Log in",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Sizes.size18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Gaps.v16,
                          const Text(
                            "Forgot password?",
                            style: TextStyle(
                              color: Color(ThemeColors.darkGray),
                              fontWeight: FontWeight.w600,
                              fontSize: Sizes.size16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: LoginSignupBottomAppBar(
          onTapFunc: _onNewAccountTap,
          buttonText: "Create new account",
        ),
      ),
    );
  }
}
