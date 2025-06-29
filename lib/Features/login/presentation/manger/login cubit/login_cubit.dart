
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user!.emailVerified) {
        emit(LoginSuccess());
      } else {
        await credential.user!.sendEmailVerification();
        emit(LoginFailure(errMessage: 'Check your email for verification.'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(errMessage: 'Wrong password provided.'));
      } else {
        emit(LoginFailure(errMessage: e.message ?? 'Unknown error.'));
      }
    }
  }

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());

    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        emit(LoginFailure(errMessage: 'Google login canceled.'));
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
      emit(LoginGoogleSuccess(
          succMessage: 'Logged in with Google successfully.'));
    } catch (e) {
      emit(LoginFailure(errMessage: 'Google login failed: $e'));
    }
  }

  Future<void> signInWithFacebook() async {
    emit(LoginLoading());

    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status == LoginStatus.success) {
        final AccessToken? accessToken = loginResult.accessToken;

        if (accessToken != null) {
          final OAuthCredential facebookAuthCredential =
              FacebookAuthProvider.credential(
                  accessToken.token); 
          await FirebaseAuth.instance
              .signInWithCredential(facebookAuthCredential);
          emit(LoginFaceBookleSuccess(
              succMessage: 'Logged in with Facebook successfully.'));
          return;
        }
      }

      emit(LoginFailure(
          errMessage: 'Facebook login failed: ${loginResult.message}'));
    } catch (e) {
      emit(LoginFailure(errMessage: 'Facebook login exception: $e'));
    }
  }
}
