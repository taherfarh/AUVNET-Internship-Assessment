import 'package:flutter/material.dart';

class Defaulttxtform extends StatelessWidget {
  Defaulttxtform({
    Key? key,
    required this.controller,
    required this.hint,
    required this.secure,
    required this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final bool secure;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: secure,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(25),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.black, fontSize: 15),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
      ),
    );
  }
}
