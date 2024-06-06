import 'package:assignment_11/constants/colors.dart';
import 'package:assignment_11/constants/gaps.dart';
import 'package:assignment_11/constants/sizes.dart';
import 'package:assignment_11/features/auth/customize_experience_screen.dart';
import 'package:assignment_11/features/auth/models/user_data.dart';
import 'package:assignment_11/features/auth/widgets/app_bar.dart';
import 'package:assignment_11/features/auth/widgets/field_check_mark.dart';
import 'package:assignment_11/features/auth/widgets/screen_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();

  late DateTime today;
  String _name = "";
  String _contact = "";
  String _birthday = "";

  final Map<String, String> _formData = {};

  bool _isBirthSeleted = false;

  void _onScafoldTap() {
    FocusScope.of(context).unfocus();

    if (_isBirthSeleted) _onBirthTap();
  }

  void _initController() {
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

    _birthdayController.addListener(() {
      setState(() {
        _birthday = _birthdayController.text;
      });
    });
  }

  bool _fieldCheck({
    required String type,
  }) {
    if (type == "name") {
      if (_name.length > 1) {
        return true;
      } else {
        return false;
      }
    } else if (type == "contact") {
      var pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

      return RegExp(pattern).hasMatch(_contact);
    } else if (type == "birthday") {
      return _birthday.isNotEmpty ? true : false;
    }

    return false;
  }

  bool _allValidCheck() {
    return _fieldCheck(type: "name") &&
        _fieldCheck(type: "contact") &&
        _fieldCheck(type: "birthday");
  }

  void _onBirthTap() {
    setState(() {
      _isBirthSeleted = !_isBirthSeleted;
    });
  }

  bool _isEmailCheck(value) {
    RegExp regex = RegExp(r'[a-zA-Z]');

    return regex.hasMatch(value);
  }

  void _onBirthdayChanged(DateTime value) {
    var date = value.toString().split(" ").first;

    setState(() {
      _birthday = date;
      _birthdayController.value = TextEditingValue(text: date);
    });
  }

  void _onNextTap() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CustomizeExperienceScreen(
              userData: UserData(
            userName: _nameController.text,
            userContact: _contactController.text,
            userBirthday: _birthdayController.text,
          )),
        ),
      );

      setState(() {
        _isBirthSeleted = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    today = DateTime.now();
    _initController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScafoldTap,
      child: Scaffold(
        appBar: const AppBarWidget(
          leadingType: LeadingType.cancel,
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
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size6,
                            ),
                            child: TextFormField(
                              controller: _nameController,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                label: Text(
                                  "Name",
                                  style: TextStyle(color: Colors.grey.shade800),
                                ),
                                suffixIcon: FieldCheckMark(
                                  switchKey: _name,
                                  valid: _fieldCheck(type: "name"),
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
                              validator: (value) {
                                if (value != null &&
                                    !_fieldCheck(type: "name")) {
                                  return "Name must be at least 2 characters.";
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                if (newValue != null) {
                                  _formData["name"] = newValue;
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size6,
                            ),
                            child: TextFormField(
                              controller: _contactController,
                              style: const TextStyle(
                                color: Color(ThemeColors.black),
                              ),
                              decoration: InputDecoration(
                                label: Text(
                                  _contact.isEmpty
                                      ? "Phone number or Email address"
                                      : _isEmailCheck(_contact)
                                          ? "Email"
                                          : "Phone number",
                                  style: TextStyle(color: Colors.grey.shade800),
                                ),
                                suffixIcon: FieldCheckMark(
                                  switchKey: _contact,
                                  valid: _fieldCheck(type: "contact"),
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
                              validator: (value) {
                                if (value != null &&
                                    !_fieldCheck(type: "contact")) {
                                  return "Please enter correct contact information.";
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                if (newValue != null) {
                                  _formData["contact"] = newValue;
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size6,
                            ),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _birthdayController,
                                  readOnly: true,
                                  onTap: _onBirthTap,
                                  decoration: InputDecoration(
                                    label: Text(
                                      "Date of birth",
                                      style: TextStyle(
                                        color: Colors.grey.shade800,
                                      ),
                                    ),
                                    hintText:
                                        _birthday.isNotEmpty ? _birthday : null,
                                    helperText: _allValidCheck()
                                        ? "This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else."
                                        : "",
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
                                    suffixIcon: FieldCheckMark(
                                      switchKey: _birthday,
                                      valid: _fieldCheck(type: "birthday"),
                                    ),
                                    border: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(ThemeColors.lightGray),
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: Sizes.size8),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please select birthday.";
                                    }
                                    return null;
                                  },
                                  onSaved: (newValue) {
                                    if (newValue != null) {
                                      _formData["birthday"] = newValue;
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: _onNextTap,
                      child: AnimatedContainer(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: 40,
                        duration: const Duration(
                          milliseconds: 150,
                        ),
                        decoration: BoxDecoration(
                          color: _fieldCheck(type: "name") &&
                                  _fieldCheck(type: "contact") &&
                                  _fieldCheck(type: "birthday")
                              ? const Color(ThemeColors.black)
                              : const Color(ThemeColors.lightGray),
                          borderRadius: BorderRadius.circular(
                            Sizes.size20,
                          ),
                        ),
                        child: const Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            top: _isBirthSeleted ? Sizes.size6 : 0,
          ),
          child: AnimatedContainer(
            height: _isBirthSeleted
                ? MediaQuery.of(context).size.height * 0.3
                : MediaQuery.of(context).size.height * 0.01,
            duration: const Duration(
              milliseconds: 150,
            ),
            transform: Matrix4.translationValues(
              0,
              _isBirthSeleted ? 0 : MediaQuery.of(context).size.height * 0.25,
              0,
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: const Color(ThemeColors.lightGray).withOpacity(0.5),
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
        ),
      ),
    );
  }
}
