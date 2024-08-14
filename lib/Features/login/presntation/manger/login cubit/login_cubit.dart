import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user!.emailVerified) {
        emit(LoginSuccess());
      } else if (credential.user!.emailVerified == false) {
        credential.user!.sendEmailVerification();
        emit(LoginFailure(errMessage: 'Chack your email.'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(
            LoginFailure(errMessage: 'Wrong password provided for that user.'));
      }
    }
  }


    Future signInWithGoogle() async {
    emit(LoginLoading());
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      return; 
    } else {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      emit(LoginGoogleSuccess(succMessage: 'Log in with Google success'));

      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
  }

  
Future<UserCredential> signInWithFacebook() async {
  emit(LoginLoading());
  final LoginResult loginResult = await FacebookAuth.instance.login();

  if (loginResult.status == LoginStatus.success) {
    final AccessToken? accessToken = loginResult.accessToken;

    if (accessToken != null) {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(accessToken.token);
          emit(LoginFaceBookleSuccess(succMessage: 'Login with facebook success'));
      return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    }
  }
  emit(LoginFailure(errMessage: "FaceBook login failed"));
  throw FirebaseAuthException(
      code: 'ERROR_FACEBOOK_LOGIN_FAILED',
      message: loginResult.message);
}

}
