import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_auth/screens/forgot_password.dart';
import 'package:flutter_email_auth/screens/signup_screen.dart';
import 'package:flutter_email_auth/services/auth_services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            TextField(
              controller: emailController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                  labelText: "Email", hintText: "Enter Your email"),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                  labelText: "Password", hintText: "Enter Your Password"),
            ),
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  _auth.SignIn(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim());
                },
                child: Container(
                  width: 70,
                  height: 60,
                  color: Colors.blue,
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text("LOGIN"),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            InkWell(
              onTap: () {
                Get.to(SignUp());
              },
              child: Container(
                height: 80,
                width: 80,
                color: Colors.red,
                child: const Text("Sign up??"),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            GestureDetector(
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                    color: Colors.cyan,
                    decoration: TextDecoration.underline),
              ),
              onTap: () {
                Get.to(ForgotPassword());
              },
            ),
          ],
        ),
      ),
    );
  }
}
