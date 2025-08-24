import 'package:flutter/material.dart';

class MyTextformField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final bool isPassword;
  const MyTextformField({
    super.key,
    required this.controller,
    required this.hint,
    this.isPassword = false,
  });

  @override
  State<MyTextformField> createState() => _MyTextformFieldState();
}

class _MyTextformFieldState extends State<MyTextformField> {
  // Password Validation
  String? errorText;

  passwordValidator(String password) {
    print("Validator function called");
    // ignore: unnecessary_null_comparison
    if (password == null || password.isEmpty) {
      setState(() {
        errorText = "Password is required";
      });

      print(errorText);
    } else if (password.length < 8) {
      setState(() {
        errorText = "Password must be at least 8 characters";
      });
      print(errorText);
    } else {
      setState(() {
        errorText = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword,
      textInputAction: TextInputAction.next,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hint,
        border: OutlineInputBorder(),
        errorText: errorText,
      ),
      onChanged: (value) {
        if (widget.isPassword) {
          passwordValidator(value);
        }
      },
      onFieldSubmitted: (value) {
        if (widget.isPassword) {
          passwordValidator(value);
        }
      },
    );
  }
}
