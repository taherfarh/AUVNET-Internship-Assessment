import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:final_app/data/model.dart';
// ignore: unused_import
import 'package:final_app/data/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  void getdata() async {
    emit(Homeloading());
    try {
      var response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
      if (response.statusCode == 200) {
        List<dynamic> decodedResponse = jsonDecode(response.body);
        List<Userdata> userlist = decodedResponse.map((item) => Userdata.fromJson(item)).toList();
        emit(HomeSuccess(userlist: userlist));
      } else {
        emit(HomeError(errormsg: "Failed to load data"));
      }
    } catch (e) {
      print(e.toString());
      emit(HomeError(errormsg: e.toString()));
    }
  }
}
