import 'package:final_app/core/OrderHistory/orderhistory_cubit.dart';
import 'package:final_app/core/cart/cart_cubit.dart';
import 'package:final_app/data/model.dart';
import 'package:final_app/models/button/defaultButton.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:final_app/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailScreen extends StatelessWidget {
  final Userdata product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Expanded(
              flex: 0,
              child: Image.network(product.image, fit: BoxFit.cover),
            ),
           const SizedBox(height: 16),
            Text(
              product.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          const  SizedBox(height: 8),
            Text(
              "\$${product.price}",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          const  SizedBox(height: 16),
           const Text(
              "Product details here...",
              style: TextStyle(fontSize: 16),
            ),
            Text("\$${product.description}"),
          const  SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Defaultbutton(
                  hint: "Check out",
                  onpressed: () {
                    context.read<OrderhistoryCubit>().addTohistory(product);
                  }),
              Defaultbutton(
                  hint: "Add to cart",
                  onpressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Added'),
                      ),
                    );

                    context.read<CartCubit>().addToCart(product);
                  }),
            ]),
          ],
        ),
      ),
    );
  }
}
