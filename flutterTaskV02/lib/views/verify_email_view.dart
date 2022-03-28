import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sortingalgorithms/sharedWidget/custom_button.dart';
import 'package:sortingalgorithms/sharedWidget/txt_button.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Your Email'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              'Please check your email and accept the verification to access the app',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'If you are not receiving email verification yet click on the button below',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          CustomButton(
            onPress: () async {
              final user = FirebaseAuth.instance.currentUser;
              await user?.sendEmailVerification();
            },
            text: 'Send email verification',
          ),
          TxtButton(
            onPress: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/login/',
                (route) => false,
              );
            },
            text: 'Restart',
          ),
        ],
      ),
    );
  }
}
