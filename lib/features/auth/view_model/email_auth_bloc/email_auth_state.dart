part of 'email_auth_bloc.dart';

sealed class EmailAuthState extends Equatable {
  const EmailAuthState();
}

final class EmailAuthInitial extends EmailAuthState {
  @override
  List<Object> get props => [];
}

final class EmailAuthLoadingState extends EmailAuthState {
  final bool isLoading;

  const EmailAuthLoadingState({this.isLoading = false});

  @override
  List<Object?> get props => [];
}

final class EmailAuthSuccessState extends EmailAuthState {
  final String successMessage;

  const EmailAuthSuccessState({required this.successMessage});

  @override
  List<Object?> get props => [successMessage];
}

final class EmailAuthFailureState extends EmailAuthState {
  final String errorMessage;

  const EmailAuthFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
