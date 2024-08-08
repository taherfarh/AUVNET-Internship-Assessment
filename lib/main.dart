import 'package:final_app/core/OrderHistory/orderhistory_cubit.dart';
import 'package:final_app/core/auth/auth_cubit.dart';
import 'package:final_app/core/cart/cart_cubit.dart';
import 'package:final_app/core/home/home_cubit.dart';
import 'package:final_app/data/repository.dart';
import 'package:final_app/firebase_options.dart';
// ignore: unused_import
import 'package:final_app/screens/homescreen/homescreen.dart';
// ignore: unused_import
import 'package:final_app/screens/loginscreen/login.dart';
// ignore: unused_import
import 'package:final_app/screens/splachscreen/splach.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: unused_import
import 'package:http/http.dart';
// ignore: unused_import
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  userrepository().getdata();

  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => OrderhistoryCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
