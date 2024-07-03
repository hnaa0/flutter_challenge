import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/gaps.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/features/authentication/view_models/login_view_model.dart';
import 'package:assignment_13/features/authentication/view_models/signup_view_model.dart';
import 'package:assignment_13/features/authentication/views/signup_screen.dart';
import 'package:assignment_13/features/authentication/widgets/login_signup_bottom_app_bar.dart';
import 'package:assignment_13/features/settings/view_models/theme_mode_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeUrl = "/login";
  static const routeName = "login";

  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _onNewAccountTap() {
    FocusScope.of(context).unfocus();
    context.pushNamed(SignupScreen.routeName);
  }

  void _onLoginTap() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      ref.read(loginProvider.notifier).login(
            contact: _formData["contact"]!,
            password: _formData["password"]!,
            context: context,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(settingsThemeModeProvider).darkMode;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: isDark
            ? const Color(ThemeColors.black)
            : const Color(ThemeColors.extraExtraLightGray),
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
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                        isDark ? Colors.black : Colors.white,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: Sizes.size10,
                                      vertical: Sizes.size16,
                                    ),
                                    hintText: "Mobile number or email",
                                    hintStyle: const TextStyle(
                                      color: Color(
                                        ThemeColors.lightGray,
                                      ),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(
                                          ThemeColors.lightGray,
                                        ),
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(
                                          ThemeColors.lightBlue,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onSaved: (newValue) {
                                    if (newValue != null) {
                                      _formData["contact"] = newValue;
                                    }
                                  },
                                ),
                                Gaps.v14,
                                TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                        isDark ? Colors.black : Colors.white,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: Sizes.size10,
                                      vertical: Sizes.size18,
                                    ),
                                    hintText: "Password",
                                    hintStyle: const TextStyle(
                                      color: Color(
                                        ThemeColors.lightGray,
                                      ),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(
                                          ThemeColors.lightGray,
                                        ),
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(
                                          ThemeColors.lightBlue,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onSaved: (newValue) {
                                    if (newValue != null) {
                                      _formData["password"] = newValue;
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          Gaps.v14,
                          GestureDetector(
                            onTap: _onLoginTap,
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: ref.watch(signupProvider).isLoading
                                    ? const Color(ThemeColors.lightGray)
                                    : const Color(ThemeColors.deepBlue),
                                borderRadius:
                                    BorderRadius.circular(Sizes.size4),
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
          isDark: isDark,
        ),
      ),
    );
  }
}
