import 'package:bloc_demo_app/commons/widgets/custom_filled_button.dart';
import 'package:bloc_demo_app/commons/widgets/custom_input_field.dart';
import 'package:bloc_demo_app/features/auth/view/auth_forget_password_view.dart';
import 'package:bloc_demo_app/features/auth/view/auth_register_view.dart';
import 'package:flutter/material.dart';

class AuthLoginView extends StatefulWidget {
  const AuthLoginView({super.key});

  @override
  State<AuthLoginView> createState() => _AuthLoginViewState();
}

class _AuthLoginViewState extends State<AuthLoginView> {
  //form key
  final formKey = GlobalKey<FormState>();

  // controller
  final TextEditingController emailLoginController = TextEditingController();
  final TextEditingController passwordLoginController = TextEditingController();

  @override
  void dispose() {
    emailLoginController.dispose();
    passwordLoginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Login"),
              SizedBox(height: 40),
              CustomInputField(
                label: "Email",
                controller: emailLoginController,
              ),
              CustomInputField(
                label: "Password",
                controller: passwordLoginController,
                isPassword: true,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AuthForgetPasswordView(),
                      ),
                    );
                  },
                  child: Text("Forget Password"),
                ),
              ),
              SizedBox(height: 40),
              CustomFilledButton(label: "Login", onPressed: () {}),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AuthRegisterView(),
                      ),
                    );
                  },
                  child: Text("Go to Register"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
