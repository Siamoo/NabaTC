import 'package:firebase1/core/utils/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogoutBody extends StatelessWidget {
  const LogoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 200,
          ),
          const Text(
            'Do you want to log out ?',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacementNamed('LoginPage');
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 248, 91, 79),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Logout',
                    style: TextStyle(color: kWhiteColor, fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              // const SizedBox(width: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'ZoomDrawerPages');
                },
                child: const Text(
                  'No',
                  style: TextStyle(color: kWhiteColor, fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
