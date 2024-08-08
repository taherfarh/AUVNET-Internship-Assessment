import 'package:final_app/core/OrderHistory/orderhistory_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: unused_import
import 'package:final_app/core/cart/cart_cubit.dart';

class OrderHistoy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: BlocBuilder<OrderhistoryCubit, OrderhistoryState>(
        builder: (context, state) {
          if (state is Orderhistory) {
            if (state.orders.isEmpty) {
              return const Center(
                child: Text('Your cart is empty'),
              );
            }
            return ListView.builder(
              itemCount: state.orders.length,
              itemBuilder: (context, index) {
                final product = state.orders[index];
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
