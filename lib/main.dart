import 'dart:developer';
import 'package:firebase1/Features/login/presntation/views/login_page.dart';
import 'package:firebase1/Features/login/presntation/views/sign_page.dart';
import 'package:firebase1/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log('User is currently signed out!');
      } else {
        log('User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          'LoginPage': (context) => const LoginPage(),
          'SignPage': (context) => const SignPage(),

          
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const EmailPasswordScreen());
  }
}

class EmailPasswordScreen extends StatelessWidget {
  const EmailPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginPage();
  }
}

