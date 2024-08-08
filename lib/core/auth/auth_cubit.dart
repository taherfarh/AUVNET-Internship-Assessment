import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  void login(String email, String password) async {
    emit(loadinglogin());
    try {
      var userdata = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (userdata.user != null) {
        emit(successlogin());
      } else {
        emit(errorlogin());
      }
    } catch (e) {
      print(e.toString());
      emit(errorlogin());
    }
  }

  void createacc(String name, String email, String password) async {
    emit(loadingcreate());

    try {
      var userdata = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (userdata.user != null) {
        firestore
            .collection("users")
            .doc(userdata.user!.uid)
            .set({"email": email, "name": name});
        emit(successcreate());
      } else {
        emit(errorcreate());
      }
    } catch (e) {
      print(e.toString());
      emit(errorcreate());
    }
  }
}
