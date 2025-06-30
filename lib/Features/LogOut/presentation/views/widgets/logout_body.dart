import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogoutBody extends StatelessWidget {
  const LogoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, 'LoginPage');
                },
                icon: Icon(Icons.logout))
          ],
        ),
      )),
    );
  }
}
