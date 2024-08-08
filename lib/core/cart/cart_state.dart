part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

final class CartInitial extends CartState {}

final class CartUpdated extends CartState {



  final List<Userdata> cartItems;
  

  CartUpdated({required this.cartItems});
}
