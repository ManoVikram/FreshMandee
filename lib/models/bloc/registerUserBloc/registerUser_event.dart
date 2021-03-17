part of 'registerUser_bloc.dart';

abstract class RegisterUserEvent {
  const RegisterUserEvent();

  @override
  List<Object> get props => [];
}

class RegisterUser extends RegisterUserEvent {
  final String firebaseUID;
  final String email;

  const RegisterUser({
    @required this.firebaseUID,
    @required this.email,
  });
}
