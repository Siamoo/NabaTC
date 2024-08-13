part of 'signin_cubit.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}
final class SigninSuccess extends SigninState {
  final String succMessage;

  SigninSuccess({required this.succMessage});
  
}
final class SigninGoogleSuccess extends SigninState {
  final String succMessage;

  SigninGoogleSuccess({required this.succMessage});

  
}
final class SigninLoading extends SigninState {}
final class SigninFailure extends SigninState {
    final String errMessage;
  SigninFailure({required this.errMessage});
}
