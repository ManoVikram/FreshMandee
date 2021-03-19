import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../../GlobalConfig.dart';

part 'updateUserData_event.dart';
part 'updateUserData_state.dart';

class UpdateUserDataBloc
    extends Bloc<UpdateUserDataEvent, UpdateUserDataState> {
  UpdateUserDataBloc() : super(UpdateUserDataState());

  @override
  Stream<UpdateUserDataState> mapEventToState(
      UpdateUserDataEvent event) async* {
    const String url = "http://$API_HOST/api/auth/update/user";

    if (event is UpdateUserData) {
      final response = await http.post(
        url,
        body: {
          "firebaseUID": event.firebaseUID,
          "name": event.name ?? null,
          "phoneNumber": event.phoneNumber ?? null,
          "location": event.location ?? null,
        },
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      UserData loadedData = UserData(
        firebaseUID: extractedData["firebaseUID"],
        name: extractedData["name"],
        email: extractedData["email"],
        phoneNumber: extractedData["phoneNumber"],
        isFarmer: extractedData["isFarmer"],
        location: extractedData["location"],
      );

      yield UpdateUserDataState(
        userData: loadedData,
      );
    }
  }
}
