import 'package:flutter/material.dart';

import '../services/auth_services.dart';

class SignUp extends StatelessWidget {
  SignUp({ Key? key }) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.all(32),
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
                onTap: () async {
                  await _auth.Signup(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim());
                },
                child: Container(
                  width: 70,
                  height: 60,
                  color: Colors.blue,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Sign up!"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );

  }
}