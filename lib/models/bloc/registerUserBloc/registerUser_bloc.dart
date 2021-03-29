import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../../GlobalConfig.dart';

part 'registerUser_event.dart';
part 'registerUser_state.dart';

class RegisterUserBloc extends Bloc<RegisterUserEvent, RegisterUserState> {
  RegisterUserBloc() : super(RegisterUserState());

  @override
  Stream<RegisterUserState> mapEventToState(RegisterUserEvent event) async* {
    // const String url = "http://$API_HOST/api/auth/registerPerson";
    const String url =
        "https://pacific-shore-21505.herokuapp.com/api/auth/registerPerson";

    if (event is RegisterUser) {
      final response = await http.post(
        url,
        body: {
          "firebaseUID": event.firebaseUID,
          "email": event.email,
        },
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      UserData loadedData = UserData(
        firebaseUID: extractedData["firebaseUID"],
        email: extractedData["email"],
      );

      yield RegisterUserState(
        userData: loadedData,
      );
    }
  }
}
