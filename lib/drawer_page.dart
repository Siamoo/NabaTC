import 'package:firebase1/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Drawerpage extends StatelessWidget {
  final Function(int) onMenuItemSelected;

  const Drawerpage({super.key, required this.onMenuItemSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPineoColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 13, 51, 53),
                        radius: 50,
                        backgroundImage: AssetImage('asset/images/profile.jpeg'),
                      ),
                    ),
              
                    const SizedBox(height: 20),
                    drawerItem("Home", 0, 'asset/icons/home.svg'),
                    drawerItem("Profile", 1, 'asset/icons/profile.svg'),
                    drawerItem("Call Us", 2, 'asset/icons/contact.svg'),
                    drawerItem("Rate App", 3, 'asset/icons/rate.svg'),
                    drawerItem("Log out", 4, 'asset/icons/logout.svg'),    
                    drawerItem("API", 5, 'asset/icons/logout.svg'),
              
              
                    
              
                    // drawerItem("Treatment", 3),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerItem(String title, int index, String iconName ) {
    return ListTile(
      leading: SvgPicture.asset(
        iconName,
        width: 20,
        height: 20,
        colorFilter: ColorFilter.mode(kWhiteColor, BlendMode.srcIn),
      ),
      title: Text(title,
          style: const TextStyle(
              color: kWhiteColor, fontSize: 20, fontWeight: FontWeight.w500)),
      onTap: () => onMenuItemSelected(index),
    );
  }
}
