import 'package:assignment_11/constants/colors.dart';
import 'package:assignment_11/constants/gaps.dart';
import 'package:assignment_11/constants/sizes.dart';
import 'package:assignment_11/features/auth/screens/password_screen.dart';
import 'package:assignment_11/features/auth/widgets/app_bar.dart';
import 'package:assignment_11/features/auth/widgets/field_check_mark.dart';
import 'package:assignment_11/features/auth/widgets/main_sub_text_pack.dart';
import 'package:assignment_11/features/auth/widgets/wide_next_button.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  const ConfirmationCodeScreen({
    super.key,
    required this.userContact,
  });

  final String userContact;

  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  final TextEditingController _pinController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isLoading = false;

  bool _isPinValid() {
    return _pinController.length == 6 ? true : false;
  }

  Future<void> _onNextTap() async {
    if (!_isPinValid()) return;

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PasswordScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _pinController.addListener(() {
      setState(() {
        _isPinValid();
      });
    });
  }

  @override
  void dispose() {
    _pinController.dispose();
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
                  main: "We sent you a code",
                  sub: "Enter it below to vertify",
                ),
                Text(
                  "${widget.userContact}.",
                  style: TextStyle(
                    color: const Color(ThemeColors.black).withOpacity(0.7),
                    fontSize: Sizes.size16,
                  ),
                ),
                Gaps.v32,
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Pinput(
                                controller: _pinController,
                                focusNode: _focusNode,
                                length: 6,
                                showCursor: false,
                                defaultPinTheme: const PinTheme(
                                  width: Sizes.size48,
                                  height: Sizes.size48,
                                  textStyle: TextStyle(
                                    fontSize: Sizes.size28,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Color(ThemeColors.lightGray),
                                      ),
                                    ),
                                  ),
                                ),
                                focusedPinTheme: const PinTheme(
                                  width: Sizes.size48,
                                  height: Sizes.size48,
                                  textStyle: TextStyle(
                                    fontSize: Sizes.size28,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Color(ThemeColors.twitterBlue),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Gaps.v16,
                          FieldCheckMark(
                              valid: _isPinValid(), switchKey: "pin"),
                        ],
                      ),
                      const Spacer(),
                      const Text(
                        "Didn't receive email?",
                        style: TextStyle(
                            color: Color(
                          ThemeColors.twitterBlue,
                        )),
                      ),
                    ],
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
                isValid: _isPinValid(),
                isLoading: _isLoading,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
