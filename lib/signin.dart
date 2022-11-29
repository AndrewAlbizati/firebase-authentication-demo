import 'package:flutter/material.dart';
import 'package:authentication_demo/authentication_service.dart';
import 'package:provider/provider.dart';

void showSignIn(BuildContext context) {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        scrollable: true,
        title: Text('Sign in'),
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
                  controller: passwordController,
                  autocorrect: false,
                  enableSuggestions: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    icon: Icon(Icons.password),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          ElevatedButton(
            child: Text('Sign in'),
            onPressed: () async {
              context
                  .read<AuthenticationService>()
                  .signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  )
                  .then((message) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
                Navigator.pop(context);
              });
            },
          ),
        ],
      );
    },
  );
}
