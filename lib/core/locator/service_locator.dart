import 'package:bloc_demo_app/core/service/auth/email_auth_service.dart';
import 'package:bloc_demo_app/features/auth/view_model/email_auth_bloc/email_auth_bloc.dart';
import 'package:bloc_demo_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  locator.registerLazySingleton(() => EmailAuthService());
  locator.registerFactory(() => EmailAuthBloc(locator<EmailAuthService>()));
}
