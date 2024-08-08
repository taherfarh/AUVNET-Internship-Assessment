import 'package:final_app/core/auth/auth_cubit.dart';
import 'package:final_app/models/button/defaultButton.dart';
import 'package:final_app/models/colors/defaultcolor.dart';
import 'package:final_app/models/textformfield/defaultTxtForm.dart';
import 'package:final_app/models/textformfield/defaultforcreate.dart';
import 'package:final_app/screens/homescreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  final emailctr = TextEditingController();
  final namectr = TextEditingController();
  final passwordctr = TextEditingController();

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
    passwordctr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          color: primarycolor,
          // padding: EdgeInsets.all(30),
          child: ListView(
            children: [
            const  SizedBox(
                height: 100,
              ),

           const   Text(
                "Hey !",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              // SizedBox(
              //   height: 2,
              // ),
            const  Text(
                "Join now",
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),

              Container(
                padding:const EdgeInsets.only(top: 50, left: 20, right: 20),
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height - 160,
                decoration:const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80),
                        topRight: Radius.circular(80))),
                child: Column(
                  children: [
                    Defaultforcreate(
                      controller: namectr,
                      hint: "Name",
                      secure: false,
                    ),
                  const  SizedBox(
                      height: 15,
                    ),
                    Defaulttxtform(
                      controller: emailctr,
                      hint: "Email",
                      secure: false,
                      validator: _validateEmail,
                    ),
                  const  SizedBox(
                      height: 15,
                    ),
                    Defaulttxtform(
                      controller: passwordctr,
                      hint: "Password",
                      secure: true,
                      validator: _validatePassword,
                    ),
                  const  SizedBox(
                      height: 15,
                    ),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is successcreate) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Success')));

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>const Homescreen(),
                            ),
                            (route) => false,
                          );
                        } else if (state is errorcreate) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Error')));
                        }
                      },
                      builder: (context, state) {
                        if (state is loadingcreate) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return Defaultbutton(
                            hint: "Create account",
                            onpressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')));
                                AuthCubit.get(context).createacc(namectr.text,
                                    emailctr.text, passwordctr.text);
                              }
                            });
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
