import 'package:firebase1/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: const Text('User Profile'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 13, 51, 53),
                    radius: 80,
                    backgroundImage: AssetImage('asset/images/profile.jpeg'),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'walid siam',
                    style: GoogleFonts.inconsolata(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'walidsiam.f@gmail.com',
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 30),
                  buildInfoTile(Icons.phone, 'Phone', '+20 1066036288'),
                  buildInfoTile(Icons.location_on, 'Location', 'Cairo, Egypt'),
                  buildInfoTile(Icons.settings, 'Settings', 'Account, Privacy'),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: kWhiteColor),
                    child: const Text(
                      'Edit profile',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }

  Widget buildInfoTile(IconData icon, String title, String value) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: Icon(icon, color: kHomeIconsBakColor),
      title: Text(title),
      subtitle: Text(value),
      trailing: const Icon(Icons.edit, size: 16),
    );
  }
}
