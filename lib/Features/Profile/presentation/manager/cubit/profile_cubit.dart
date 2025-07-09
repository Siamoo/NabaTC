import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ImagePicker _picker = ImagePicker();

  ProfileCubit() : super(ProfileInitial()) {
    loadUser();
  }

  void loadUser() {
    final user = _auth.currentUser;
    if (user != null) {
      emit(ProfileLoaded(user: user, phoneNumber: user.phoneNumber ?? '01066036288'));
    } else {
      emit(ProfileError("No user logged in"));
    }
  }

  Future<void> pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final file = File(pickedFile.path);
        final currentState = state;
        if (currentState is ProfileLoaded) {
          emit(ProfileLoaded(
              user: currentState.user,
              phoneNumber: currentState.phoneNumber,
              imageFile: file));
        }
      }
    } catch (e) {
      emit(ProfileError("Failed to pick image: $e"));
    }
  }

  Future<void> updateProfile(String name, String phoneNumber) async {
    try {
      emit(ProfileLoading());
      final user = _auth.currentUser;
      await user!.updateDisplayName(name);
      await user.reload();
      final refreshedUser = _auth.currentUser!;
      emit(ProfileLoaded(user: refreshedUser, phoneNumber: phoneNumber));
    } catch (e) {
      emit(ProfileError("Failed to update profile: $e"));
    }
  }
}
