import 'package:bloc/bloc.dart';
import 'package:final_app/data/model.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());



  List<Userdata> cartItems = [];

  void addToCart(Userdata product) {
    cartItems.add(product);
    emit(CartUpdated(cartItems: cartItems));


  }

  void removeFromCart(Userdata product) {}
}
