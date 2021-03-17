import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../../GlobalConfig.dart';

part 'registerFarmer_event.dart';
part 'registerFarmer_state.dart';

class RegisterFarmerBloc
    extends Bloc<RegisterFarmerEvent, RegisterFarmerState> {
  RegisterFarmerBloc() : super(RegisterFarmerState());

  @override
  Stream<RegisterFarmerState> mapEventToState(
      RegisterFarmerEvent event) async* {
    const String url = "http://$API_HOST/api/auth/farmer/registerFarmer";

    if (event is RegisterFarmer) {
      final response = await http.post(
        url,
        body: {
          "adminFirebaseUID": ADMIN_FIREBASEUID,
          "firebaseUID": event.firebaseUID,
          "email": event.email,
          "name": event.name,
          "phoneNumber": event.phoneNumber,
          "location": event.location,
        },
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      FarmerData loadedData = FarmerData(
        firebaseUID: extractedData["firebaseUID"],
        name: extractedData["name"],
        email: extractedData["email"],
        phoneNumber: extractedData["phoneNumber"],
        isFarmer: extractedData["isFarmer"],
        location: extractedData["location"],
      );

      yield RegisterFarmerState(
        farmerData: loadedData,
      );
    }
  }
}
