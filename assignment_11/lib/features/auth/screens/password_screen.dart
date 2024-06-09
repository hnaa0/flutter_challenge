import 'package:assignment_11/constants/colors.dart';
import 'package:assignment_11/constants/gaps.dart';
import 'package:assignment_11/constants/sizes.dart';
import 'package:assignment_11/features/auth/screens/interests_screen.dart';
import 'package:assignment_11/features/auth/widgets/app_bar.dart';
import 'package:assignment_11/features/auth/widgets/field_check_mark.dart';
import 'package:assignment_11/features/auth/widgets/main_sub_text_pack.dart';
import 'package:assignment_11/features/auth/widgets/wide_next_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  String _password = "";
  bool _isShowed = false;

  bool _isPasswordValid() {
    return _password.length > 7 ? true : false;
  }

  void _isEyeTap() {
    setState(() {
      _isShowed = !_isShowed;
    });
  }

  void _onNextTap() {
    if (!_isPasswordValid()) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
      },
      child: Scaffold(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MainSubTextPack(
                  main: "You'll need a password",
                  sub: "Make sure it's 8 charactrers or more.",
                ),
                Gaps.v36,
                TextField(
                  obscureText: !_isShowed,
                  focusNode: _focusNode,
                  controller: _passwordController,
                  autocorrect: false,
                  decoration: InputDecoration(
                    label: Text(
                      "Password",
                      style: TextStyle(color: Colors.grey.shade800),
                    ),
                    hintText: "Password",
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
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: _isEyeTap,
                          child: Icon(
                            _isShowed
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            color: const Color(
                              ThemeColors.lightGray,
                            ),
                          ),
                        ),
                        Gaps.h16,
                        FieldCheckMark(
                          switchKey: _password,
                          valid: _isPasswordValid(),
                        ),
                      ],
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: Sizes.size8),
                  ),
                  cursorColor: const Color(
                    ThemeColors.twitterBlue,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
              bottom: _focusNode.hasFocus
                  ? MediaQuery.of(context).viewInsets.bottom
                  : 0),
          child: BottomAppBar(
            height: 80,
            color: const Color(ThemeColors.extraExtraLightGray),
            elevation: 0,
            child: GestureDetector(
              onTap: _onNextTap,
              child: WideNextButton(
                isValid: _isPasswordValid(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
