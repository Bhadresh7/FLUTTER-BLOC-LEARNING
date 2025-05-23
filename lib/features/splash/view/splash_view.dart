import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    decideScreen(context);
  }

  Future<void> decideScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));

    // Auth Box
    final authBox = await Hive.openBox('userAuthBox');
    final authStatus = authBox.get('userAuthStatus', defaultValue: false);

    if (authStatus) {
      GoRouter.of(context).pushReplacementNamed("home");
    } else {
      GoRouter.of(context).pushReplacementNamed("authLogin");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Text("Splash"),
        ),
      ),
    );
  }
}
