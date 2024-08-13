part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginSuccess extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginGoogleSuccess extends LoginState {
  final String succMessage;

  LoginGoogleSuccess({required this.succMessage});
}
final class LoginFaceBookleSuccess extends LoginState {
  final String succMessage;

  LoginFaceBookleSuccess({required this.succMessage});

}
final class LoginFailure extends LoginState {
    final String errMessage;
  LoginFailure({required this.errMessage});
}
