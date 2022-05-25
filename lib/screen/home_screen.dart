import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_auth_demo/screen/logged_in_screen.dart';
import 'package:google_auth_demo/screen/signup_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), // jika google login, maka akan terjadi perubahan
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return const LoggedInScreen();
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something Wrong!'));
          } else {
            return const SignUpScreen();
          }
        },
      ),
    );
  }
}
