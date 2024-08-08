import 'package:final_app/core/auth/auth_cubit.dart';
import 'package:final_app/models/button/defaultButton.dart';
import 'package:final_app/models/colors/defaultcolor.dart';
import 'package:final_app/models/textformfield/defaultTxtForm.dart';
import 'package:final_app/screens/homescreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailctr = TextEditingController();
  final passctr = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    const pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    const pattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Password must be at least 8 characters long, include an uppercase letter, lowercase letter, number, and special character';
    }
    return null;
  }

  @override
  void dispose() {
    emailctr.dispose();
    passctr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(25),
          child: ListView(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Welcome back!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Enter your details to login",
                style: TextStyle(
                    color: primarycolor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text("Email",
                  style: TextStyle(
                      color: primarycolor, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 8,
              ),
              Defaulttxtform(
                controller: emailctr,
                hint: 'email@example.com',
                secure: false,
                validator: _validateEmail,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text("Password",
                  style: TextStyle(
                      color: primarycolor, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 8,
              ),
              Defaulttxtform(
                controller: passctr,
                hint: '***********',
                secure: true,
                validator: _validatePassword,
              ),
              const SizedBox(
                height: 15,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is successlogin) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Success')),
                    );
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Homescreen(),
                      ),
                      (route) => false,
                    );
                  } else if (state is errorlogin) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Error')),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is loadinglogin) {
                    return const Center(child: const CircularProgressIndicator());
                  }
                  return Defaultbutton(
                    hint: "Login",
                    onpressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')));
                        AuthCubit.get(context)
                            .login(emailctr.text, passctr.text);
                      }
                    },
                  );
                },
              ),

              
            ],
          ),
        ),
      ),
    );
  }
}
