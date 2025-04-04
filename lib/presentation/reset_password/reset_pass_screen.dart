import 'package:flutter/material.dart';
import 'package:reservation_system/component/button/ui_button.dart';
import 'package:reservation_system/component/dialog/ui_dialog.dart';
import 'package:reservation_system/component/textinput/ui_text_input.dart';
import 'package:reservation_system/gen/assets.gen.dart';
import 'package:reservation_system/models/validator_login/validator.dart';
import 'package:reservation_system/routes/route_named.dart';

class ResetPassScreen extends StatefulWidget {
  const ResetPassScreen({super.key});

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6EFE8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    Image.asset(
                      Assets.images.imgLogoBbq.path,
                      width: 211,
                      height: 102,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "ENTER YOUR NEW PASSWORD",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Montserrat",
                        letterSpacing: 2,
                        color: Color(0xff483232),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 16),
                    UITextInput(
                      hintText: "New Password",
                      type: "password",
                      obscureText: true,
                      controller: passwordController,
                      validator: Validator.validatePassword,
                    ),
                    const SizedBox(height: 10),
                    UITextInput(
                      hintText: "Confirm Password",
                      type: "password",
                      obscureText: true,
                      controller: confirmPasswordController,
                      validator:
                          (value) => Validator.validateConfirmPassword(
                            value,
                            passwordController.text,
                          ),
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      text: "SAVE",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ModalBottomSheet.showSheet(context, () {
                            Navigator.pushReplacementNamed(
                              context,
                              Routenamed.login,
                              arguments: <String, dynamic>{
                                "newPass": passwordController.text,
                              },
                            );
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
