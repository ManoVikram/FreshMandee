import 'package:flutter/material.dart';

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
      routes: {},
    );
  }
}

class TheFarm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

void main() => runApp(MyApp());
