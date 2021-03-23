import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../../GlobalConfig.dart';

part 'completeUserData_event.dart';
part 'completeUserData_state.dart';

class CompleteUserDataBloc
    extends Bloc<CompleteUserDataEvent, CompleteUserDataState> {
  CompleteUserDataBloc() : super(CompleteUserDataState());

  @override
  Stream<CompleteUserDataState> mapEventToState(
      CompleteUserDataEvent event) async* {
    const String url = "http://$API_HOST/api/auth/profile";

    if (event is GetCompleteUserData) {
      final response = await http.post(
        url,
        body: {
          "firebaseUID": event.firebaseUID,
        },
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      UserData loadedData = UserData(
        firebaseUID: extractedData["firebaseUID"],
        email: extractedData["email"],
        name: extractedData["name"],
        phoneNumber: extractedData["phoneNumber"],
        isFarmer: extractedData["isFarmer"],
        productsBought: extractedData["productsBuy"],
      );

      yield CompleteUserDataState(
        userData: loadedData,
      );
    }
  }
}
