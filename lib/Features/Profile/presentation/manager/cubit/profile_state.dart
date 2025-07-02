import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final User user;
  final String phoneNumber;
  final File? imageFile;

  ProfileLoaded({required this.user, required this.phoneNumber, this.imageFile});
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}
