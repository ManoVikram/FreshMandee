part of 'registerFarmer_bloc.dart';

abstract class RegisterFarmerEvent {
  const RegisterFarmerEvent();

  @override
  List<Object> get props => [];
}

class RegisterFarmer extends RegisterFarmerEvent {
  final String firebaseUID;
  final String email;
  final String name;
  final String phoneNumber;
  final String location;

  const RegisterFarmer({
    @required this.firebaseUID,
    @required this.email,
    @required this.name,
    @required this.phoneNumber,
    @required this.location,
  });
}
