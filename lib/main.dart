import 'package:firebase1/Features/Ai/presntation/manger/ai%20cubit/upload_cubit.dart';
import 'package:firebase1/Features/Ai/presntation/views/ai_page.dart';
import 'package:firebase1/Features/Ask/ask_page.dart';
import 'package:firebase1/Features/Home/home_page.dart';
import 'package:firebase1/Features/Note/data/models/model.dart';
import 'package:firebase1/Features/Note/presntation/manger/add_note_cubit/add_note_cubit.dart';
import 'package:firebase1/Features/Note/presntation/manger/notes_cubit/notes_cubit.dart';
import 'package:firebase1/Features/Note/presntation/views/note_page.dart';
import 'package:firebase1/Features/OnBoarding/on_boarding_view.dart';
import 'package:firebase1/Features/Profile/presntation/views/profile_page.dart';
import 'package:firebase1/Features/info/info_page.dart';
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
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';


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
        ),
        BlocProvider(
          create: (context) => UploadCubit(),
        ),
        
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

        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.dosisTextTheme(ThemeData.dark().textTheme),
          scaffoldBackgroundColor: kPrimaryColor,
        ),
        home: const MainPage(),
      ),
    );
  }
}

class MangeUser extends StatelessWidget {
  const MangeUser({super.key});

  @override
  Widget build(BuildContext context) {
    return (FirebaseAuth.instance.currentUser?.emailVerified ?? false)
        ?  const MainPage()
        : const OnBoardingView();
  }

}


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  void _onTap(int index) {
    if (_currentIndex == index) {
      // If tapped again, pop to first route in stack
      _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  Widget _buildOffstageNavigator(int index, Widget child) {
    return Offstage(
      offstage: _currentIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (_) => MaterialPageRoute(
          builder: (_) => child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildOffstageNavigator(0, const HomePage()),
          _buildOffstageNavigator(1, const ProfilePage()),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: kOrangeColor,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
            selectedColor: kOrangeColor,
          ),
        ],
      ),
    );
  }
}
