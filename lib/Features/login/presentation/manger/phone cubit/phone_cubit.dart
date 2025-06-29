import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'phone_state.dart';

class PhoneCubit extends Cubit<PhoneState> {
  PhoneCubit() : super(PhoneInitial());
    FirebaseAuth auth = FirebaseAuth.instance;
      String? verificationID;

  void verifyPhoneNumber(String phoneNumber) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        emit(PhoneVerified(verifyMessage: 'Phone number verified and user signed in: ${auth.currentUser}'));
      },
      verificationFailed: (FirebaseAuthException e) {
        emit(PhoneFailure(errMessage: 'Failed to verify phone number: ${e.message}'));
      },
      codeSent: (String verificationId, int? resendToken) {
        verificationID = verificationId;
        emit(PhoneCodeSent());
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationID = verificationId;
      },
    );
  }

  void verifyOtp(String otp) async {
    emit(PhoneLoading());
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID!,
        smsCode: otp,
      );

      await auth.signInWithCredential(credential);
      emit(PhoneSuccess());
    } catch (e) {
      emit(PhoneFailure(errMessage: 'Failed to verify OTP: ${e.toString()}'));
    }
  }


}

