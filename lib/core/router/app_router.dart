import 'package:bloc_demo_app/features/auth/view/auth_login_view.dart';
import 'package:bloc_demo_app/features/auth/view/auth_register_view.dart';
import 'package:bloc_demo_app/features/home/view/home_view.dart';
import 'package:bloc_demo_app/features/splash/view/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: "/",
    routes: [
      // splash view
      GoRoute(
        path: "/",
        name: "splash",
        builder: (context, state) => SplashView(),
      ),
      // auth Login view
      GoRoute(
        path: "/authLogin",
        name: "authLogin",
        builder: (context, state) => AuthLoginView(),
      ),
      // auth register view
      GoRoute(
        path: "/authRegister",
        name: "authRegister",
        builder: (context, state) => AuthRegisterView(),
      ),
      // home view
      GoRoute(
        path: "/home",
        name: "home",
        builder: (context, state) => HomeView(),
      ),
    ],
  );
}
