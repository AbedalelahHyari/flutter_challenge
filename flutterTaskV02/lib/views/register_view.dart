import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sortingalgorithms/sharedWidget/custom_button.dart';
import 'package:sortingalgorithms/sharedWidget/txt_button.dart';
import '../firebase_options.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: FutureBuilder(
        // this widget will initialize the firebase application before make any operation like login or logout
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        controller: _email,
                        enableSuggestions: false,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            hintText: "Enter your email here"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        controller: _password,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: "Enter your password here"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: CustomButton(
                        onPress: () async {
                          final email = _email.text;
                          final password = _password.text;
                          try {
                            /* I make an instance from firebase auth that will check if the user credential that will match the roles fot the firebase registration process*/
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: email,
                              password: password,
                            );
                            final user = FirebaseAuth.instance.currentUser;
                            user?.sendEmailVerification();
                            /* I declare a variable called user that will contain of the current user as value
                            then I will user sendEmailVerification function which belongs to the FirebaseAuth that will send an email to the registered user to verify his account
                            */

                            Navigator.of(context).pushNamed('/verify_email/');
                          } on FirebaseAuthException catch (err) {
                            /* I make an exception handling on catch block special to the FirebaseAuthException that will handle
                            the error for the FirebaseAuthentication when the user make a register process
                            */
                            if (err.code == 'weak-password') {
                              await showErrorDialog(
                                context,
                                'Weak Password',
                              );
                            } else if (err.code == 'email-already-in-use') {
                              await showErrorDialog(
                                context,
                                'The email exist',
                              );
                            } else if (err.code == 'invalid-email') {
                              await showErrorDialog(
                                context,
                                'The Email you have entered not correct',
                              );
                            } else {
                              await showErrorDialog(
                                context,
                                'Error  ${err.code}',
                              );
                            }
                          } catch (err) {
                            await showErrorDialog(
                              context,
                              '$err',
                            );
                          }
                        },
                        text: "Register",
                      ),
                    ),
                    TxtButton(
                      onPress: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          '/login/',
                          (route) => false,
                        );
                      },
                      text: 'Go to Login Page',
                    )
                  ],
                ),
              );
            default:
              return const Text("Loading....");
          }
        },
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////
// this future function will show the errors Dialog which belongs to FirebaseAuthException on the register process //
Future<void> showErrorDialog(BuildContext context, String text) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Error happened while register'),
        content: Text(text),
        actions: [
          TxtButton(
            onPress: () {
              Navigator.of(context).pop();
            },
            text: 'back',
          )
        ],
      );
    },
  );
}
