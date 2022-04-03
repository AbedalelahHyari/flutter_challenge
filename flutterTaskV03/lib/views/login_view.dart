import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sortingalgorithms/sharedWidget/custom_button.dart';
import 'package:sortingalgorithms/sharedWidget/txt_button.dart';
import '../firebase_options.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  ////////////////////////////////////////////////////

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
        title: const Text("Login"),
      ),
      body: FutureBuilder(
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
                          hintText: "Enter your email here",
                        ),
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
                          hintText: "Enter your password here",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: CustomButton(
                        onPress: () async {
                          final email = _email.text;
                          final password = _password.text;
                          try {
                            // I make an instance from firebase auth that will check if the user credential that will match the stored in the firebase storage
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: email,
                              password: password,
                            );
                            final user = FirebaseAuth.instance.currentUser;
                            // on try block //
                            // I make an condition to check if the user exist first then if he verified or not if the condition output true will take the user to analysis view if false will take it to the verify email view//
                            if (user?.emailVerified ?? false) {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                '/analysis/',
                                (route) => false,
                              );
                            } else {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                '/verify_email/',
                                (route) => false,
                              );
                            }
                          } on FirebaseAuthException catch (err) {
                            /* I make an exception handling on catch block special to the FirebaseAuthException that will handle
                            the error for the FirebaseAuthentication
                            */

                            if (err.code == 'user-not-found') {
                              await showErrorDialog(
                                context,
                                'The Email Not Found',
                              );
                            } else if (err.code == 'wrong-password') {
                              await showErrorDialog(
                                context,
                                'The password is wrong',
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
                        text: "Login",
                      ),
                    ),
                    TxtButton(
                      onPress: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          '/register/',
                          (route) => false,
                        );
                      },
                      text: 'Go to Register Page',
                    ),
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

///////////////////////////////////////////////////////////////////////////////

// this future function will show the errors Dialog which belongs to FirebaseAuthException on login process //
Future<void> showErrorDialog(BuildContext context, String text) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Error happened while login'),
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
