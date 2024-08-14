import 'package:firebase1/Features/Home/presntation/views/home_page.dart';
import 'package:firebase1/Features/login/presntation/manger/login_cubit/login_cubit.dart';
import 'package:firebase1/Features/login/presntation/manger/signin_cubit/signin_cubit.dart';
import 'package:firebase1/Features/login/presntation/views/login_page.dart';
import 'package:firebase1/Features/login/presntation/views/phone_page.dart';
import 'package:firebase1/Features/login/presntation/views/sign_page.dart';
import 'package:firebase1/firebase_options.dart';
import 'package:firebase1/simple_bloc_observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SigninCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        )
      ],
      child: MaterialApp(
        routes: {
          'LoginPage': (context) => const LoginPage(),
          'SignPage': (context) => const SignPage(),
          'HomePage': (context) => const HomePage(),
          'PhonePage': (context) => const PhonePage(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const MangeUser(),
      ),
    );
  }
}

class MangeUser extends StatelessWidget {
  const MangeUser({super.key});

  @override
  Widget build(BuildContext context) {
    return (FirebaseAuth.instance.currentUser?.emailVerified ?? false)
        ? const HomePage()
        : const LoginPage();
  }
}
