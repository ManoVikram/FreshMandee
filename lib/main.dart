import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import './screens/loginScreen.dart';
import './screens/signupScreen.dart';
import './screens/otpScreen.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "The Farm Market",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: TheFarm(),
      routes: {
        LoginScreen.routeName: (contxt) => LoginScreen(),
        SignupScreen.routeName: (contxt) => SignupScreen(),
      },
    );
  }
}

class TheFarm extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Center(
            child: Text("ERROR" + snapshot.error),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return OTPScreen();
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
