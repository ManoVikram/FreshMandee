import 'package:flutter/material.dart';

import './screens/loginScreen.dart';
import './screens/signupScreen.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignupScreen(),
    );
  }
}

void main() => runApp(MyApp());
