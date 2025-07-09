import 'package:firebase1/core/utils/constant/constant.dart';
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
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Avatar
                      Padding(
                        padding: const EdgeInsets.only(left: 22),
                        child: CircleAvatar(
                          backgroundColor: kWhiteColor,
                          radius: 40,
                          child: ClipOval(
                            child: Image.asset(
                              'asset/icons/drawer.gif',
                              fit: BoxFit.cover,
                              width: 65,
                              height: 65,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Drawer Items
                      drawerItem(
                          "Home", 0, 'asset/icons/home.svg', kWhiteColor),
                      drawerItem(
                          "Profile", 1, 'asset/icons/profile.svg', kWhiteColor),
                      drawerItem(
                          "Call Us", 2, 'asset/icons/contact.svg', kWhiteColor),
                      drawerItem(
                          "Log out", 3, 'asset/icons/logout.svg', kWhiteColor),
                      drawerItem(
                          "Rate App", 4, 'asset/icons/rate.svg', kWhiteColor),
                      drawerItem("About Us", 5, 'asset/icons/about us.svg',
                          kWhiteColor),
                      drawerItem("API", 6, 'asset/icons/api.svg', kPineoColor),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Image
            Padding(
              padding: const EdgeInsets.only(bottom: 10,),
              child: Image.asset('asset/images/drawer.png'),
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerItem(String title, int index, String iconName, Color color) {
    return ListTile(
      leading: SvgPicture.asset(
        iconName,
        width: 20,
        height: 20,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
      title: Text(title,
          style: TextStyle(
              color: color, fontSize: 20, fontWeight: FontWeight.w500)),
      onTap: () => onMenuItemSelected(index),
    );
  }
}
