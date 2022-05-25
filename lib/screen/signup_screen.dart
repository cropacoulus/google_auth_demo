import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_auth_demo/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          const Spacer(),
          const FlutterLogo(
            size: 120,
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Hey There,\nWelcome Back',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Login to your account to continue',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const Spacer(),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                primary: Colors.white, onPrimary: Colors.black, minimumSize: const Size(double.infinity, 50)),
            icon: const FaIcon(FontAwesomeIcons.google),
            label: const Text('Sign Up with Google'),
            onPressed: () {
              final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogin();
            },
          ),
          const SizedBox(
            height: 40,
          ),
          RichText(
            text: const TextSpan(
              text: 'Already have an account? ',
              children: [
                TextSpan(
                  text: 'Login',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
