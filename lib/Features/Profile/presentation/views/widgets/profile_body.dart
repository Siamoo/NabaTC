import 'dart:io';
import 'package:firebase1/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  final ImagePicker _picker = ImagePicker();
  User? user = FirebaseAuth.instance.currentUser;

  String phoneNumber = '+20 1066036288';
  File? _localImageFile;

  @override
  void initState() {
    super.initState();
    phoneNumber = user?.phoneNumber ?? '+20 1066036288';
  }

  Future<void> _pickImageLocally() async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        final File file = File(pickedFile.path);

        setState(() {
          _localImageFile = file; // Just keep local image, no upload
        });
      }
    } catch (e) {
      debugPrint('❌ Failed to pick image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error picking image: $e")),
      );
    }
  }

  Future<void> _showEditProfileDialog() async {
    TextEditingController nameController =
        TextEditingController(text: user?.displayName ?? "");
    TextEditingController phoneController =
        TextEditingController(text: phoneNumber);

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Profile Info'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Display Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), // Cancel
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              String newName = nameController.text.trim();
              String newPhone = phoneController.text.trim();

              if (newName.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Name can't be empty")),
                );
                return;
              }
              if (newPhone.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Phone can't be empty")),
                );
                return;
              }

              try {
                await user!.updateDisplayName(newName);
                await user!.reload();

                setState(() {
                  user = FirebaseAuth.instance.currentUser;
                  phoneNumber = newPhone;
                });

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Profile info updated")),
                );
              } catch (e) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Failed to update profile: $e")),
                );
              }
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
        title: const Text('User Profile'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: user == null
            ? const Center(child: Text("No user logged in"))
            : CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: _pickImageLocally,
                          child: CircleAvatar(
                            key: ValueKey(_localImageFile?.path ??
                                user?.photoURL ??
                                'default'),
                            backgroundColor:
                                const Color.fromARGB(255, 13, 51, 53),
                            radius: 80,
                            backgroundImage: _localImageFile != null
                                ? FileImage(_localImageFile!)
                                : (user?.photoURL != null
                                    ? NetworkImage(user!.photoURL!)
                                    : null),
                            child: (_localImageFile == null &&
                                    user?.photoURL == null)
                                ? const Icon(Icons.person,
                                    size: 80, color: Colors.white)
                                : null,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          user!.displayName ?? "No Name",
                          style: GoogleFonts.inconsolata(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          user!.email ?? "walidsiam@gmail.com",
                          style: GoogleFonts.poppins(
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 30),
                        buildInfoTile(Icons.phone, 'Phone', phoneNumber),
                        buildInfoTile(
                            Icons.location_on, 'Location', 'Cairo, Egypt'),
                        buildInfoTile(
                            Icons.settings, 'Settings', 'Account, Privacy'),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: _showEditProfileDialog,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kWhiteColor),
                          child: const Text(
                            'Edit profile',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget buildInfoTile(IconData icon, String title, String value) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: Icon(icon, color: kHomeIconsBakColor),
      title: Text(title),
      subtitle: Text(value),
      // trailing: const Icon(Icons.edit, size: 16),
    );
  }
}




