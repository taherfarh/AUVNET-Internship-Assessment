import 'package:bloc/bloc.dart';
// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app/data/model.dart';
import 'package:meta/meta.dart';

part 'orderhistory_state.dart';

class OrderhistoryCubit extends Cubit<OrderhistoryState> {
  OrderhistoryCubit() : super(OrderhistoryInitial());

  List<Userdata> orders = [];

  void addTohistory(Userdata product) {
    orders.add(product);
    emit(Orderhistory(orders: orders));
  }
}
