import 'package:firebase1/Features/Home/home_page.dart';
import 'package:firebase1/Features/Note/data/models/model.dart';
import 'package:firebase1/Features/Note/presntation/manger/add_note_cubit/add_note_cubit.dart';
import 'package:firebase1/Features/Note/presntation/manger/notes_cubit/notes_cubit.dart';
import 'package:firebase1/Features/Note/presntation/views/note_page.dart';
import 'package:firebase1/Features/OnBoarding/on_boarding_view.dart';
import 'package:firebase1/Features/login/presntation/manger/login%20cubit/login_cubit.dart';
import 'package:firebase1/Features/login/presntation/manger/phone%20cubit/phone_cubit.dart';
import 'package:firebase1/Features/login/presntation/manger/signin%20cubit/signin_cubit.dart';
import 'package:firebase1/Features/login/presntation/views/login_page.dart';
import 'package:firebase1/Features/login/presntation/views/phone_page.dart';
import 'package:firebase1/Features/login/presntation/views/sign_page.dart';
import 'package:firebase1/constant.dart';
import 'package:firebase1/firebase_options.dart';
import 'package:firebase1/simple_bloc_observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ModelAdapter());
  await Hive.openBox<Model>(kModelBox);
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
        ),
        BlocProvider(
          create: (context) => PhoneCubit(),
        ),
        BlocProvider(
          create: (context) => AddNoteCubit(),
        ),
        BlocProvider(
          create: (context) => NotesCubit()..fetchAllNotes(),
        )
      ],
      child: MaterialApp(
        routes: {
          'LoginPage': (context) => const LoginPage(),
          'SignPage': (context) => const SignPage(),
          'NotePage': (context) => const NotePage(),
          'PhonePage': (context) => const PhonePage(),
          'OnBoardingView': (context) => const OnBoardingView(),
          'HomePage': (context) => const HomePage(),

        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor),
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
        : const OnBoardingView();
  }




}


