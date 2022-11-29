import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: Container(
            alignment: Alignment.centerLeft, child: Text('Home Page')),
      ),
      body: Center(
        child: Column(
          children: [
            Text('HOME'),
            ElevatedButton(
              onPressed: () async {
                FirebaseAuth auth = FirebaseAuth.instance;
                await auth.signOut();
              },
              child: Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
