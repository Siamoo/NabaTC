import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());

  Future<void> signin({
    required String email,
    required String password,
  }) async {
    emit(SigninLoading());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      credential.user!.sendEmailVerification();
      emit(SigninSuccess(succMessage: 'Check your email to verified'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SigninFailure(errMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SigninFailure(
            errMessage: 'The account already exists for that email.'));
      }
    } catch (e) {
      emit(SigninFailure(errMessage: e.toString()));
    }
  }


}
