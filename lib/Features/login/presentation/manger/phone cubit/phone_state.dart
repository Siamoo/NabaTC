part of 'phone_cubit.dart';

@immutable
sealed class PhoneState {}

final class PhoneInitial extends PhoneState {}
final class PhoneSuccess extends PhoneState {}
final class PhoneLoading extends PhoneState {}
final class PhoneCodeSent extends PhoneState {}
final class PhoneFailure extends PhoneState {
   final String errMessage;

  PhoneFailure({required this.errMessage});
}
final class PhoneVerified extends PhoneState {
   final String verifyMessage;

  PhoneVerified({required this.verifyMessage});

  
}
