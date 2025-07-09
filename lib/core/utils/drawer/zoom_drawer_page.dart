import 'package:firebase1/Features/API/presentation/views/change_api_link_page.dart';
import 'package:firebase1/Features/AboutUs/presentation/views/about_us_page.dart';
import 'package:firebase1/Features/CallUs/presentation/views/call_us_page.dart';
import 'package:firebase1/Features/Home/home_page.dart';
import 'package:firebase1/Features/Profile/presentation/views/profile_page.dart';
import 'package:firebase1/Features/LogOut/presentation/views/logout_page.dart';
import 'package:firebase1/Features/RateApp/presentation/view/rate_app_page.dart';
import 'package:firebase1/core/utils/constant/constant.dart';
import 'package:firebase1/core/utils/drawer/drawer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class ZoomDrawerPages extends StatefulWidget {
  const ZoomDrawerPages({super.key});

  @override
  State<ZoomDrawerPages> createState() => _ZoomDrawerPagesState();
}

class _ZoomDrawerPagesState extends State<ZoomDrawerPages> {
  final ZoomDrawerController _controller = ZoomDrawerController();
  int selectedIndex = 0;

  final List<Widget> screens = [
    const HomePage(),
    const ProfilePage(),
    const CallUsPage(),
    const LogoutPage(),
    const RategAppPage(),
    const AboutUsPage(),
    const ChangeApiLinkPage(),
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
      mainScreen: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Image.asset('asset/images/NabatcLogo.png', height: 34, ),
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
