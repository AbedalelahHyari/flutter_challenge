import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sortingalgorithms/views/analysis_view.dart';
import 'package:sortingalgorithms/views/login_view.dart';
import 'package:sortingalgorithms/views/register_view.dart';
import 'package:sortingalgorithms/views/verify_email_view.dart';
import 'package:sortingalgorithms/views/visual_view.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      // This is the routes for the application and every route its considered as page view //
      routes: {
        '/login/': (context) => const LoginView(),
        '/register/': (context) => const RegisterView(),
        '/analysis/': (context) => const AnalysisView(),
        '/visual/': (context) => const VisualView(),
        '/verify_email/': (context) => const VerifyEmailView()
      },
    ),
  );
}
/////////////////////////////////////////////////////////////////////////////

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            //print(user?.emailVerified);
            if (user != null) {
              if (user.emailVerified) {
                return const AnalysisView();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
