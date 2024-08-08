import 'package:flutter/material.dart';

class Defaultforcreate extends StatelessWidget {
  Defaultforcreate({
    Key? key,
    required this.controller,
    required this.hint,
    required this.secure,
    
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final bool secure;
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: secure,
      
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
