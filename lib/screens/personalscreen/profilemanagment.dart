import 'package:final_app/core/auth/auth_cubit.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding:const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.network(
                  'https://th.bing.com/th/id/OIP.q7sfHQeSL7b6B5YehBQa1gHaEv?rs=1&pid=ImgDetMain',
                  width: 150.0,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
           const SizedBox(
              height: 10,
            ),
            Card(
              child: ListTile(
                title:
                    Text("${AuthCubit.get(context).auth.currentUser!.email}"),
              ),
            ),
          const  SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
