import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/gaps.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/features/authentication/widgets/login_signup_bottom_app_bar.dart';
import 'package:assignment_13/features/authentication/widgets/signup_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  static const routeUrl = "/signup";
  static const routeName = "signup";

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
    if (_formKey.currentState!.validate()) {}
  }

  void _onHaveAccount() {
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
                                ),
                                Gaps.v14,
                                SignupFormField(
                                  controller: _contactController,
                                  fieldValue: _contact,
                                  formData: _formData,
                                  filedType: "contact",
                                ),
                                Gaps.v14,
                                SignupFormField(
                                  controller: _passwordController,
                                  fieldValue: _password,
                                  formData: _formData,
                                  filedType: "password",
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
                                color: const Color(ThemeColors.deepBlue),
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
          onTapFunc: _onHaveAccount,
          buttonText: "Already have an account",
        ),
      ),
    );
  }
}