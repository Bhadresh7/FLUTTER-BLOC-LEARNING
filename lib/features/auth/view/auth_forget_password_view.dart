import 'package:bloc_demo_app/commons/widgets/custom_filled_button.dart';
import 'package:bloc_demo_app/commons/widgets/custom_input_field.dart';
import 'package:bloc_demo_app/features/auth/view/auth_login_view.dart';
import 'package:flutter/material.dart';

class AuthForgetPasswordView extends StatefulWidget {
  const AuthForgetPasswordView({super.key});

  @override
  State<AuthForgetPasswordView> createState() => _AuthForgetPasswordViewState();
}

class _AuthForgetPasswordViewState extends State<AuthForgetPasswordView> {
  //form key
  final formKey = GlobalKey<FormState>();

  // controller
  final TextEditingController emailForgetPasswordController =
      TextEditingController();

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
              Text("Forget Password"),
              SizedBox(height: 40),
              CustomInputField(
                label: "Email",
                controller: emailForgetPasswordController,
              ),
              SizedBox(height: 40),
              CustomFilledButton(label: "Login", onPressed: () {}),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AuthLoginView()),
                    );
                  },
                  child: Text("Go back to Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
