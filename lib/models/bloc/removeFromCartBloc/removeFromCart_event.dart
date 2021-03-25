part of 'removeFromCart_bloc.dart';

abstract class RemoveFromCartEvent {
  const RemoveFromCartEvent();

  @override
  List<Object> get props => [];
}

class RemoveProduct extends RemoveFromCartEvent {
  final String firebaseUID;
  final String productID;

  const RemoveProduct({
    @required this.firebaseUID,
    @required this.productID,
  });
}
