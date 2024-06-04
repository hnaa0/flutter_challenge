import 'package:assignment_11/constants/gaps.dart';
import 'package:assignment_11/constants/sizes.dart';
import 'package:assignment_11/features/auth/customize_experience_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late DateTime today;
  String birthday = "";

  Map<String, String> formData = {};

  bool _isNameFieldValid = false;
  bool _isEmailFieldValid = false;
  bool _isBirthSeleted = false;

  void _onScafoldTap() {
    FocusScope.of(context).unfocus();

    if (_isBirthSeleted) _onBirthTap();
  }

  void _fieldCheck({
    required String value,
    required String type,
  }) {
    if (type == "name") {
      setState(() {
        if (value.length > 1) {
          _isNameFieldValid = true;
        } else {
          _isNameFieldValid = false;
        }
      });
    } else if (type == "email") {
      var pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

      setState(() {
        _isEmailFieldValid = RegExp(pattern).hasMatch(value);
      });
    }
  }

  void _onBirthTap() {
    setState(() {
      _isBirthSeleted = !_isBirthSeleted;
    });
  }

  void _onBirthdayChanged(DateTime value) {
    var date = value.toString().split(" ").first;

    setState(() {
      birthday = date;
    });
  }

  void _onNextTap() {
    if (!birthday.isNotEmpty || !_isEmailFieldValid || !_isNameFieldValid) {
      return;
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CustomizeExperienceScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    today = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScafoldTap,
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Icon(
            FontAwesomeIcons.twitter,
            color: Theme.of(context).primaryColor,
            size: Sizes.size28,
          ),
          toolbarHeight: 80,
          leadingWidth: Sizes.size80,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size28,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Create your account",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: Sizes.size28,
                      ),
                    ),
                    Gaps.v16,
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size10,
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                label: Text(
                                  "Name",
                                  style: TextStyle(color: Colors.grey.shade800),
                                ),
                                suffixIcon: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 150),
                                  transitionBuilder: (Widget child,
                                      Animation<double> animation) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                  child: _isNameFieldValid
                                      ? Container(
                                          key:
                                              ValueKey<bool>(_isNameFieldValid),
                                          width: Sizes.size32,
                                          height: Sizes.size32,
                                          decoration: BoxDecoration(
                                            color: const Color(0xff41B06E),
                                            borderRadius: BorderRadius.circular(
                                              Sizes.size28,
                                            ),
                                          ),
                                          child: const Icon(
                                            FontAwesomeIcons.check,
                                            color: Colors.white,
                                            size: Sizes.size18,
                                          ),
                                        )
                                      : null,
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffAAB8C2),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              onSaved: (value) {
                                if (value != null) {
                                  formData["name"] = value;
                                }
                              },
                              onChanged: (value) =>
                                  _fieldCheck(type: "name", value: value),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size10,
                            ),
                            child: TextFormField(
                              style: const TextStyle(
                                color: Color(0xff14171A),
                              ),
                              decoration: InputDecoration(
                                label: Text(
                                  "Phone number or Email address",
                                  style: TextStyle(color: Colors.grey.shade800),
                                ),
                                suffixIcon: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 200),
                                  transitionBuilder: (Widget child,
                                      Animation<double> animation) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                  child: _isEmailFieldValid
                                      ? Container(
                                          key: ValueKey<bool>(
                                              _isEmailFieldValid),
                                          width: Sizes.size32,
                                          height: Sizes.size32,
                                          decoration: BoxDecoration(
                                            color: const Color(0xff41B06E),
                                            borderRadius: BorderRadius.circular(
                                              Sizes.size28,
                                            ),
                                          ),
                                          child: const Icon(
                                            FontAwesomeIcons.check,
                                            color: Colors.white,
                                            size: Sizes.size18,
                                          ),
                                        )
                                      : null,
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffAAB8C2),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              onChanged: (value) =>
                                  _fieldCheck(type: "email", value: value),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size10,
                            ),
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please select birthday.";
                                    }
                                    return null;
                                  },
                                  readOnly: true,
                                  onTap: _onBirthTap,
                                  decoration: InputDecoration(
                                    hintText: birthday,
                                    label: birthday.isNotEmpty
                                        ? null
                                        : Text(
                                            "Date of birth",
                                            style: TextStyle(
                                              color: Colors.grey.shade800,
                                            ),
                                          ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffAAB8C2),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    suffixIcon: AnimatedSwitcher(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      transitionBuilder: (Widget child,
                                          Animation<double> animation) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      },
                                      child: birthday.isNotEmpty
                                          ? Container(
                                              // key: ValueKey<bool>(
                                              //     _isBirthdayFieldValid),
                                              width: Sizes.size32,
                                              height: Sizes.size32,
                                              decoration: BoxDecoration(
                                                color: const Color(0xff41B06E),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  Sizes.size28,
                                                ),
                                              ),
                                              child: const Icon(
                                                FontAwesomeIcons.check,
                                                color: Colors.white,
                                                size: Sizes.size18,
                                              ),
                                            )
                                          : null,
                                    ),
                                    border: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffAAB8C2),
                                      ),
                                    ),
                                  ),
                                ),
                                Gaps.v12,
                                Text(
                                  birthday.isNotEmpty
                                      ? "This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else."
                                      : "",
                                  style: const TextStyle(
                                    color: Color(0xff657786),
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
                    GestureDetector(
                      onTap: _onNextTap,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        alignment: Alignment.center,
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                          color: birthday.isNotEmpty &&
                                  _isEmailFieldValid &&
                                  _isNameFieldValid
                              ? const Color(0xff14171A)
                              : const Color(0xffAAB8C2),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: const Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   height: 200,
                    // ),
                    AnimatedContainer(
                      height: MediaQuery.of(context).size.height * 0.25,
                      duration: const Duration(
                        milliseconds: 150,
                      ),
                      transform: Matrix4.translationValues(
                          0,
                          _isBirthSeleted
                              ? 0
                              : MediaQuery.of(context).size.height * 0.25,
                          0),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: const Color(0xffAAB8C2).withOpacity(0.5),
                            width: 1,
                          ),
                        ),
                      ),
                      child: CupertinoDatePicker(
                        maximumDate: today,
                        initialDateTime: today,
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (value) => _onBirthdayChanged(value),
                      ),
                    ),
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
