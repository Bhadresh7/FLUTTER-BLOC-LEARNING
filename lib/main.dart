import 'package:bloc_demo_app/core/locator/service_locator.dart';
import 'package:bloc_demo_app/core/router/app_router.dart';
import 'package:bloc_demo_app/features/auth/view_model/email_auth_bloc/email_auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setUpLocator();
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
      //DI using getIt
      providers: [BlocProvider(create: (context) => locator<EmailAuthBloc>())],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
