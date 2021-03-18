part of 'userCart_bloc.dart';

abstract class UserCartEvent {
  const UserCartEvent();

  @override
  List<Object> get props => [];
}

class AddToCart extends UserCartEvent {
  final String firebaseUID;
  final String productID;
  final int quantity;

  const AddToCart({
    @required this.firebaseUID,
    @required this.productID,
    @required this.quantity,
  });
}

class RemoveFromCart extends UserCartEvent {
  final String firebaseUID;
  final String productID;

  const RemoveFromCart({
    @required this.firebaseUID,
    @required this.productID,
  });
}

class ViewCart extends UserCartEvent {
  final String firebaseUID;

  const ViewCart({
    @required this.firebaseUID,
  });
}
