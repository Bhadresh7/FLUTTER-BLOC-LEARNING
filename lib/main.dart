import 'package:bloc_demo_app/core/service/auth/email_auth_service.dart';
import 'package:bloc_demo_app/features/auth/view_model/email_auth_bloc/email_auth_bloc.dart';
import 'package:bloc_demo_app/features/splash/view/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Hive setup
  await Hive.initFlutter();
  //auth box
  await Hive.openBox("userAuthBox");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => EmailAuthBloc(EmailAuthService())),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: SplashView()),
    );
  }
}
