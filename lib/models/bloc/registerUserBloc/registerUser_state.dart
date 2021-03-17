part of 'registerUser_bloc.dart';

class UserData {
  final String firebaseUID;
  final String email;

  UserData({
    this.firebaseUID,
    this.email,
  });
}

class RegisterUserState extends Equatable {
  final UserData userData;

  const RegisterUserState({
    this.userData,
  });

  @override
  List<Object> get props => [userData];
}
