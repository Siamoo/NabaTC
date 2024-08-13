import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: (){
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, 'LoginPage');
            }, icon: const Icon(Icons.logout))
          ],
        ),
      ),
    );
  }
}