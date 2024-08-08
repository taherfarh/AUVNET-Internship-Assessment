import 'package:final_app/models/colors/defaultcolor.dart';
import 'package:final_app/screens/loginscreen/login.dart';
import 'package:flutter/material.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  void  initState() {
    Future.delayed( const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) =>const LoginScreen()));
    });
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: primarycolor,
            ),
            Padding(padding: EdgeInsets.only(left: 7)),
            Text(
              "Fashion",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
