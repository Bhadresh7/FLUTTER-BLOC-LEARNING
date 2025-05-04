part of 'email_auth_bloc.dart';

sealed class EmailAuthEvent extends Equatable {
  const EmailAuthEvent();
}

class RegisterEmailPasswordEvent extends EmailAuthEvent {
  final String userEmail;
  final String userPassword;

  const RegisterEmailPasswordEvent({
    required this.userEmail,
    required this.userPassword,
  });

  @override
  List<Object?> get props => [userEmail, userPassword];
}

class LoginEmailPasswordEvent extends EmailAuthEvent {
  final String userEmail;
  final String userPassword;

  const LoginEmailPasswordEvent({
    required this.userEmail,
    required this.userPassword,
  });

  @override
  List<Object?> get props => [userEmail, userPassword];
}

class ForgetEmailPasswordSendLinkEvent extends EmailAuthEvent {
  final String userEmail;

  const ForgetEmailPasswordSendLinkEvent({required this.userEmail});

  @override
  List<Object?> get props => [userEmail];
}
