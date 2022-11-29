import 'package:flutter/material.dart';
import 'package:authentication_demo/authentication_service.dart';
import 'package:provider/provider.dart';

void showSignUp(BuildContext context) {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController password1Controller = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        scrollable: true,
        title: Text('Sign up'),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  enableSuggestions: false,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    icon: Icon(Icons.mail),
                  ),
                ),
                TextFormField(
                  controller: password1Controller,
                  autocorrect: false,
                  enableSuggestions: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    icon: Icon(Icons.password),
                  ),
                ),
                TextFormField(
                  controller: password2Controller,
                  autocorrect: false,
                  enableSuggestions: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password again',
                    icon: Icon(Icons.password),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          ElevatedButton(
            child: Text('Sign up'),
            onPressed: () async {
              if (password1Controller.text.toLowerCase() ==
                  password2Controller.text.toLowerCase()) {
                context
                    .read<AuthenticationService>()
                    .signUp(
                      email: emailController.text.trim(),
                      password: password1Controller.text.trim(),
                    )
                    .then((message) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(message)));
                  Navigator.pop(context);
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        Text('Passwords don\'t match, please try again.')));
                Navigator.pop(context);
              }
            },
          ),
        ],
      );
    },
  );
}
