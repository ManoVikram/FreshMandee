import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import './screens/loginScreen.dart';
import './screens/signupScreen.dart';
import './screens/otpScreen.dart';
import './screens/homeScreen.dart';
import './models/phoneNumber.dart';

import './colorPalette.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (contxt) => PhoneNumber(),
        ),
      ],
      child: MaterialApp(
        title: "The Farm Market",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: white,
          primaryColor: primaryGreen,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: grey),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TheFarm(),
        routes: {
          LoginScreen.routeName: (contxt) => LoginScreen(),
          SignupScreen.routeName: (contxt) => SignupScreen(),
          OTPScreen.routeName: (contxt) => OTPScreen(),
          HomeScreen.routeName: (contxt) => HomeScreen(),
        },
      ),
    );
  }
}

class TheFarm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (userSnapshot.connectionState == ConnectionState.active) {
            // FirebaseAuth.instance.signOut();
            if (userSnapshot.hasData) {
              return HomeScreen();
            }
          }

          return LoginScreen();
        },
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
