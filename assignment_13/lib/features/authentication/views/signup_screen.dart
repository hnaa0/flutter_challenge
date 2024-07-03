import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/gaps.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/features/authentication/view_models/signup_view_model.dart';
import 'package:assignment_13/features/authentication/widgets/login_signup_bottom_app_bar.dart';
import 'package:assignment_13/features/authentication/widgets/signup_form_field.dart';
import 'package:assignment_13/features/settings/view_models/theme_mode_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends ConsumerStatefulWidget {
  static const routeUrl = "/signup";
  static const routeName = "signup";

  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _name = "";
  String _contact = "";
  String _password = "";

  final Map<String, String> _formData = {};

  void initController() {
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
    _contactController.addListener(() {
      setState(() {
        _contact = _contactController.text;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  void _onSignupTap() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      ref.read(signupProvider.notifier).signup(
            data: _formData,
            context: context,
          );
    }
  }

  void _onHaveAccountTap() {
    FocusScope.of(context).unfocus();
    context.pop();
  }

  @override
  void initState() {
    super.initState();
    initController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                      height: 200,
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
                                SignupFormField(
                                  controller: _nameController,
                                  fieldValue: _name,
                                  formData: _formData,
                                  filedType: "name",
                                  isDark: isDark,
                                ),
                                Gaps.v14,
                                SignupFormField(
                                  controller: _contactController,
                                  fieldValue: _contact,
                                  formData: _formData,
                                  filedType: "contact",
                                  isDark: isDark,
                                ),
                                Gaps.v14,
                                SignupFormField(
                                  controller: _passwordController,
                                  fieldValue: _password,
                                  formData: _formData,
                                  filedType: "password",
                                  isDark: isDark,
                                ),
                              ],
                            ),
                          ),
                          Gaps.v14,
                          GestureDetector(
                            onTap: _onSignupTap,
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
                                  "Sign up",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Sizes.size18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
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
          onTapFunc: _onHaveAccountTap,
          buttonText: "Already have an account",
          isDark: isDark,
        ),
      ),
    );
  }
}
