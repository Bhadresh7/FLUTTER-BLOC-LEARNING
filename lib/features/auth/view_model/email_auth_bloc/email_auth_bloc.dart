import 'package:bloc/bloc.dart';
import 'package:bloc_demo_app/core/service/auth/email_auth_service.dart';
import 'package:equatable/equatable.dart';

part 'email_auth_event.dart';
part 'email_auth_state.dart';

class EmailAuthBloc extends Bloc<EmailAuthEvent, EmailAuthState> {
  final EmailAuthService service;

  EmailAuthBloc(this.service) : super(EmailAuthInitial()) {
    on<RegisterEmailPasswordEvent>((event, emit) async {
      emit(EmailAuthLoadingState(isLoading: true));
      try {
        await service.register(
          email: event.userEmail,
          password: event.userPassword,
        );

        emit(
          EmailAuthSuccessState(successMessage: "Email created Successfully"),
        );
      } catch (e) {
        emit(EmailAuthFailureState(errorMessage: e.toString()));
        emit(EmailAuthLoadingState(isLoading: false));
      }
    });
  }
}
