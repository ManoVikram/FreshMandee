part of 'viewCart_bloc.dart';

abstract class ViewCartEvent {
  const ViewCartEvent();

  @override
  List<Object> get props => [];
}

class ViewCart extends ViewCartEvent {
  final String firebaseUID;

  const ViewCart({
    @required this.firebaseUID,
  });
}
