part of 'updateUserData_bloc.dart';

class UserData {
  final String firebaseUID;
  final String name;
  final String email;
  final String phoneNumber;
  final String location;
  final bool isFarmer;

  UserData({
    this.firebaseUID,
    this.name,
    this.email,
    this.phoneNumber,
    this.location,
    this.isFarmer,
  });
}

class UpdateUserDataState extends Equatable {
  final UserData userData;

  UpdateUserDataState({
    this.userData,
  });

  @override
  List<Object> get props => [userData];
}
