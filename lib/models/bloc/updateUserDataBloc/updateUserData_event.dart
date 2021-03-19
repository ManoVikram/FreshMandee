part of 'updateUserData_bloc.dart';

abstract class UpdateUserDataEvent {
  const UpdateUserDataEvent();

  @override
  List<Object> get props => [];
}

class UpdateUserData extends UpdateUserDataEvent {
  final String firebaseUID;
  final String name;
  final String phoneNumber;
  final String location;

  const UpdateUserData({
    @required this.firebaseUID,
    this.name,
    this.phoneNumber,
    this.location,
  });
}
