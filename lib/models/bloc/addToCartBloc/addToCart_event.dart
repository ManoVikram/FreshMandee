part of 'addToCart_bloc.dart';

abstract class AddToCartEvent {
  const AddToCartEvent();

  @override
  List<Object> get props => [];
}

class AddToCart extends AddToCartEvent {
  final String firebaseUID;
  final String productID;
  final int quantity;

  const AddToCart({
    @required this.firebaseUID,
    @required this.productID,
    @required this.quantity,
  });

  @override
  List<Object> get props => [firebaseUID, productID, quantity];
}
