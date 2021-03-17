part of 'registerFarmer_bloc.dart';

class FarmerData {
  final String firebaseUID;
  final String email;
  final String name;
  final String phoneNumber;
  final bool isFarmer;
  final String location;

  FarmerData({
    this.firebaseUID,
    this.email,
    this.name,
    this.phoneNumber,
    this.isFarmer,
    this.location,
  });
}

class RegisterFarmerState extends Equatable {
  final FarmerData farmerData;

  const RegisterFarmerState({
    this.farmerData,
  });

  @override
  List<Object> get props => [farmerData];
}
