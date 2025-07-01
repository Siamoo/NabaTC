import 'package:firebase1/Features/Ai/presentation/manager/ai%20cubit/upload_cubit.dart';
import 'package:firebase1/Features/Ai/presentation/views/ai_page.dart';
import 'package:firebase1/Features/Ask/ask_page.dart';
import 'package:firebase1/Features/Home/home_page.dart';
import 'package:firebase1/Features/Note/data/models/model.dart';
import 'package:firebase1/Features/Note/presntation/manger/add_note_cubit/add_note_cubit.dart';
import 'package:firebase1/Features/Note/presntation/manger/notes_cubit/notes_cubit.dart';
import 'package:firebase1/Features/Note/presntation/views/note_page.dart';
import 'package:firebase1/Features/OnBoarding/on_boarding_view.dart';
import 'package:firebase1/Features/Profile/presentation/views/profile_page.dart';
import 'package:firebase1/Features/Search/presentation/views/Search_page.dart';
import 'package:firebase1/Features/Treatment/presntation/manager/Cubit/treatment_cubit.dart';
import 'package:firebase1/Features/info/info_page.dart';
import 'package:firebase1/Features/login/presentation/manger/login%20cubit/login_cubit.dart';
import 'package:firebase1/Features/login/presentation/manger/phone%20cubit/phone_cubit.dart';
import 'package:firebase1/Features/login/presentation/manger/signin%20cubit/signin_cubit.dart';
import 'package:firebase1/Features/login/presentation/views/login_page.dart';
import 'package:firebase1/Features/login/presentation/views/phone_page.dart';
import 'package:firebase1/Features/login/presentation/views/sign_page.dart';
import 'package:firebase1/constant.dart';
import 'package:firebase1/firebase_options.dart';
import 'package:firebase1/simple_bloc_observer.dart';
import 'package:firebase1/zoom_drawer_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ModelAdapter());
  await Hive.openBox<Model>(kModelBox);
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
        BlocProvider(create: (context) => SigninCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => PhoneCubit()),
        BlocProvider(create: (context) => AddNoteCubit()),
        BlocProvider(create: (context) => NotesCubit()..fetchAllNotes()),
        BlocProvider(create: (context) => UploadCubit()),
        BlocProvider(create: (context) => TreatmentCubit()),
      ],
      child: MaterialApp(
        routes: {
          'OnBoardingView': (context) => const OnBoardingView(),
          'LoginPage': (context) => const LoginPage(),
          'PhonePage': (context) => const PhonePage(),
          'SignPage': (context) => const SignPage(),
          'HomePage': (context) => const HomePage(),
          'NotePage': (context) => const NotePage(),
          'InfoPage': (context) => const InfoPage(),
          'AiPage': (context) => const AiPage(),
          'AskPage': (context) => const AskPage(),
          'ProfilePage': (context) => const ProfilePage(),
          'ZoomDrawerpages': (context) => const ZoomDrawerpages(),
          'SearchPage': (context) => const SearchPage(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.dosisTextTheme(ThemeData.dark().textTheme),
          scaffoldBackgroundColor: kPrimaryColor,
        ),
        home: const ManageUser(),
      ),
    );
  }
}




class ManageUser extends StatelessWidget {
  const ManageUser({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final user = snapshot.data;

        if (user != null) {
          // Optional: Check for email verification if needed
          // if (user.email != null && !user.emailVerified) {
          //   return const LoginPage(); // or ask to verify email
          // }
          return const ZoomDrawerpages();
        } else {
          return const OnBoardingView();
        }
      },
    );
  }
}
