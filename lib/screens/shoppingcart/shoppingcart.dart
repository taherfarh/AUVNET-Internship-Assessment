import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_app/core/cart/cart_cubit.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Shopping Cart'),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartUpdated) {
            if (state.cartItems.isEmpty) {
              return const Center(
                child: Text('Your cart is empty'),
              );
            }
            return ListView.builder(
              itemCount: state.cartItems.length,
              itemBuilder: (context, index) {
                final product = state.cartItems[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      product.image,
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    ),
                    title: Text(product.title),
                    subtitle: Text('\$${product.price.toString()}'),
                    trailing: IconButton(
                      icon:const Icon(Icons.delete),
                      onPressed: () {
                        // Implement remove from cart functionality here
                      },
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text('Loading...'),
          );
        },
      ),
    );
  }
}
