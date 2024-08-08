import 'package:final_app/models/colors/defaultcolor.dart';
import 'package:flutter/material.dart';

class Defaultbutton extends StatelessWidget {
  const Defaultbutton({super.key, required this.hint, required this.onpressed});

  final String hint;

  final void Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: primarycolor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      onPressed: onpressed,
      child: Text(
        hint,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
