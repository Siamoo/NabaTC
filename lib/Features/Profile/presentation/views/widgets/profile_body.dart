import 'package:firebase1/Features/Profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:firebase1/Features/Profile/presentation/manager/cubit/profile_state.dart';
import 'package:firebase1/Features/Profile/presentation/views/widgets/build_info_tile.dart';
import 'package:firebase1/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  void _showEditProfileDialog(BuildContext context, User user, String phone) {
    final nameController = TextEditingController(text: user.displayName ?? "");
    final phoneController = TextEditingController(text: phone);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Edit Profile Info'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Display Name')),
            const SizedBox(height: 16),
            TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number')),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              final name = nameController.text.trim();
              final phone = phoneController.text.trim();
              context.read<ProfileCubit>().updateProfile(name, phone);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(

          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('User Profile'),
            ],
          ), backgroundColor: kPrimaryColor),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileError) {
              return Center(child: Text(state.message));
            } else if (state is ProfileLoaded) {
              final user = state.user;
              final phone = state.phoneNumber;
              final image = state.imageFile;

              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => context.read<ProfileCubit>().pickImage(),
                          child: CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 13, 51, 53),
                            radius: 80,
                            backgroundImage: image != null
                                ? FileImage(image)
                                : (user.photoURL != null
                                    ? NetworkImage(user.photoURL!)
                                    : null) as ImageProvider?,
                            child: (image == null && user.photoURL == null)
                                ? const Icon(Icons.person,
                                    size: 80, color: Colors.white)
                                : null,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(user.displayName ?? "No Name",
                            style: GoogleFonts.inconsolata(
                                fontSize: 28, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text(user.email ?? "",
                            style: GoogleFonts.poppins(color: Colors.white70)),
                        const SizedBox(height: 30),
                        BuildInfoTile(
                            icon: Icons.phone, title: 'Phone', value: phone),
                        BuildInfoTile(
                            icon: Icons.location_on,
                            title: 'Location',
                            value: 'Cairo, Egypt'),
                        BuildInfoTile(
                            icon: Icons.settings,
                            title: 'Settings',
                            value: 'Account, Privacy'),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () =>
                              _showEditProfileDialog(context, user, phone),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kWhiteColor),
                          child: const Text('Edit profile',
                              style: TextStyle(color: kPrimaryColor)),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return const Center(child: Text("Loading..."));
          },
        ),
      ),
    );
  }
}
