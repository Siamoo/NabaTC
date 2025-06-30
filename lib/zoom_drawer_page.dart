


import 'package:firebase1/Features/API/presentation/views/change_api_link_page.dart';
import 'package:firebase1/Features/CallUs/presentation/views/call_us_page.dart';
import 'package:firebase1/Features/Home/home_page.dart';
import 'package:firebase1/Features/Profile/presentation/views/profile_page.dart';
import 'package:firebase1/Features/LogOut/presentation/views/logout_page.dart';
import 'package:firebase1/Features/RateApp/presentation/view/rate_app_page.dart';
import 'package:firebase1/constant.dart';
import 'package:firebase1/drawer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class ZoomDrawerpages extends StatefulWidget {
  const ZoomDrawerpages({super.key});

  @override
  State<ZoomDrawerpages> createState() => _ZoomDrawerpagesState();
}

class _ZoomDrawerpagesState extends State<ZoomDrawerpages> {
  final ZoomDrawerController _controller = ZoomDrawerController();
  int selectedIndex = 0;

  final List<Widget> screens = [
    const HomePage(),
    const ProfilePage(),
    const CallUsPage(),
    const RategAppPage(),
    const LogoutPage(),
    const ChangeApiLinkPage()
  ];

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _controller,
      menuScreen: Drawerpage(
        onMenuItemSelected: (index) {
          setState(() => selectedIndex = index);
          _controller.toggle!();
        },
      ),
      mainScreen:
          // const MainPage(),
          Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "plants",
              style: GoogleFonts.bangers(
                textStyle: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: kOrangeColor,
                ),
              ),
            ),
            backgroundColor: kPrimaryColor,
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.menu,
                ),
                onPressed: () => _controller.toggle!(),
              ),
            ]),
        body: screens[selectedIndex],
      ),
      borderRadius: 24.0,
      showShadow: true,
      angle: -12.0,
      menuBackgroundColor: kPineodarkColor,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
    );
  }
}
