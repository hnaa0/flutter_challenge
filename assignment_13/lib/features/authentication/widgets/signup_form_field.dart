import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupFormField extends StatefulWidget {
  const SignupFormField({
    super.key,
    required this.controller,
    required this.fieldValue,
    required this.formData,
    required this.filedType,
  });

  final TextEditingController controller;
  final String fieldValue;
  final String filedType;
  final Map<String, String> formData;

  @override
  State<SignupFormField> createState() => _SignupFormFieldState();
}

class _SignupFormFieldState extends State<SignupFormField> {
  bool _passwordHidden = true;

  void _onEyeTap() {
    setState(() {
      _passwordHidden = !_passwordHidden;
    });
  }

  bool _formFieldCheck({required String type, required String value}) {
    switch (type) {
      case "name":
        if (value.length > 1) {
          return true;
        } else {
          return false;
        }
      case "contact":
        if (_isEmailCheck(value)) {
          var pattern =
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

          return RegExp(pattern).hasMatch(value);
        } else {
          var pattern = r'^[0-9]+$';

          return RegExp(pattern).hasMatch(value);
        }
      case "password":
        return value.length >= 8 ? true : false;
    }
    return false;
  }

  bool _isEmailCheck(value) {
    RegExp regex = RegExp(r'[a-zA-Z]');

    return regex.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:
          _passwordHidden && widget.filedType == "password" ? true : false,
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Sizes.size10,
          vertical: Sizes.size16,
        ),
        labelText: widget.filedType,
        labelStyle: const TextStyle(
          color: Color(ThemeColors.lightGray),
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
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(
              ThemeColors.red,
            ),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(
              ThemeColors.red,
            ),
          ),
        ),
        suffix: widget.filedType == "password"
            ? GestureDetector(
                onTap: _onEyeTap,
                child: FaIcon(
                  _passwordHidden
                      ? FontAwesomeIcons.eyeSlash
                      : FontAwesomeIcons.eye,
                  size: Sizes.size18,
                  color: const Color(ThemeColors.darkGray),
                ),
              )
            : null,
      ),
      validator: (value) {
        switch (widget.filedType) {
          case "name":
            if (value != null &&
                !_formFieldCheck(
                    type: widget.filedType, value: widget.fieldValue)) {
              return "Name must be at least 2 characters.";
            }
            return null;
          case "contact":
            if (value != null &&
                !_formFieldCheck(
                    type: widget.filedType, value: widget.fieldValue)) {
              return "Please correct email or phone number(excluding '-').";
            }
            return null;
          case "password":
            if (value != null &&
                !_formFieldCheck(
                    type: widget.filedType, value: widget.fieldValue)) {
              return "Password must be at least 8 characters.";
            }
            return null;
        }

        return null;
      },
      onSaved: (newValue) {
        if (newValue != null) {
          widget.formData[widget.filedType] = newValue;
        }
      },
    );
  }
}
