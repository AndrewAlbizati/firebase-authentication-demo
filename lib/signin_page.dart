import 'package:flutter/material.dart';
import 'package:authentication_demo/signin.dart';
import 'package:authentication_demo/signup.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text('Sign in'),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  child: Text('Sign in'),
                  onPressed: () {
                    showSignIn(context);
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  child: Text('Sign up'),
                  onPressed: () {
                    showSignUp(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
