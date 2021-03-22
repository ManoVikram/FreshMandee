part of 'completeUserData_bloc.dart';

abstract class CompleteUserDataEvent {
  const CompleteUserDataEvent();

  @override
  List<Object> get props => [];
}

class GetCompleteUserData extends CompleteUserDataEvent {
  final String firebaseUID;

  const GetCompleteUserData({
    @required this.firebaseUID,
  });
}
