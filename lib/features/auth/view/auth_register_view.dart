import 'package:bloc_demo_app/commons/widgets/custom_filled_button.dart';
import 'package:bloc_demo_app/commons/widgets/custom_input_field.dart';
import 'package:bloc_demo_app/core/helpers/toast_helper.dart';
import 'package:bloc_demo_app/features/auth/view/auth_login_view.dart';
import 'package:bloc_demo_app/features/auth/view_model/email_auth_bloc/email_auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

class AuthRegisterView extends StatefulWidget {
  const AuthRegisterView({super.key});

  @override
  State<AuthRegisterView> createState() => _AuthRegisterViewState();
}

class _AuthRegisterViewState extends State<AuthRegisterView> {
  //form key
  final formKey = GlobalKey<FormState>();

  // controller
  final TextEditingController emailRegisterController = TextEditingController();
  final TextEditingController passwordRegisterController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<EmailAuthBloc, EmailAuthState>(
          listener: (context, state) async {
            if (state is EmailAuthSuccessState) {
              final box = await Hive.openBox('userAuthBox');
              await box.put('userAuthStatus', true);

              ToastHelper.showToast(
                message: "Created Successfully",
                backgroundColor: Colors.green,
              );

              GoRouter.of(context).pushReplacementNamed("home");
            } else if (state is EmailAuthFailureState) {
              ToastHelper.showToast(message: "Failed to create a user");
            }
          },
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Register"),
                  SizedBox(height: 40),
                  CustomInputField(
                    label: "Email",
                    controller: emailRegisterController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      return null;
                    },
                  ),
                  CustomInputField(
                    label: "Password",
                    controller: passwordRegisterController,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40),
                  BlocBuilder<EmailAuthBloc, EmailAuthState>(
                    builder: (context, state) {
                      return CustomFilledButton(
                        isLoading: state is EmailAuthLoadingState,
                        label: "Register",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<EmailAuthBloc>().add(
                              RegisterEmailPasswordEvent(
                                userEmail: emailRegisterController.text.trim(),
                                userPassword:
                                    passwordRegisterController.text.trim(),
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AuthLoginView(),
                          ),
                        );
                      },
                      child: Text("Go to Login"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
