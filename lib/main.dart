import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import './screens/loginScreen.dart';
import './screens/signupScreen.dart';
import './screens/otpScreen.dart';
import './screens/homeScreen.dart';
import './screens/productDetailsScreen.dart';
import './screens/userCartScreen.dart';
import './screens/userAccountScreen.dart';

import './models/provider/phoneNumber.dart';

import './models/bloc/allCategoriesBloc/allCategories_bloc.dart';
import './models/bloc/placeOrderBloc/placeOrder_bloc.dart';
import './models/bloc/productsUnderCategoryBloc/productsUnderCategory_bloc.dart';
import './models/bloc/registerFarmerBloc/registerFarmer_bloc.dart';
import './models/bloc/registerUserBloc/registerUser_bloc.dart';
import './models/bloc/updateUserDataBloc/updateUserData_bloc.dart';
import './models/bloc/userCart/userCart_bloc.dart';
import './models/bloc/completeUserDataBloc/completeUserData_bloc.dart';

import './colorPalette.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AllCategoriesBloc>(
          create: (contxt) => AllCategoriesBloc(),
        ),
        BlocProvider<PlaceOrderBloc>(
          create: (contxt) => PlaceOrderBloc(),
        ),
        BlocProvider<ProductsUnderCategoryBloc>(
          create: (contxt) => ProductsUnderCategoryBloc(),
        ),
        BlocProvider<RegisterFarmerBloc>(
          create: (contxt) => RegisterFarmerBloc(),
        ),
        BlocProvider<RegisterUserBloc>(
          create: (contxt) => RegisterUserBloc(),
        ),
        BlocProvider<UpdateUserDataBloc>(
          create: (contxt) => UpdateUserDataBloc(),
        ),
        BlocProvider<UserCartBloc>(
          create: (contxt) => UserCartBloc(),
        ),
        BlocProvider<CompleteUserDataBloc>(
          create: (contxt) => CompleteUserDataBloc(),
        ),
      ],
      child: MultiProvider(
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
            ProductDetailsScreen.routeName: (contxt) => ProductDetailsScreen(),
            UserCartScreen.routeName: (contxt) => UserCartScreen(),
            UserAccountScreen.routeName: (contxt) => UserAccountScreen(),
          },
        ),
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
