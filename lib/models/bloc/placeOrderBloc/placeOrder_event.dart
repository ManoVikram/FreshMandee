part of 'placeOrder_bloc.dart';

abstract class PlaceOrderEvent {
  const PlaceOrderEvent();

  @override
  List<Object> get props => [];
}

class PlaceOrder extends PlaceOrderEvent {
  final String firebaseUID;

  PlaceOrder({
    @required this.firebaseUID,
  });
}

class ViewOrders extends PlaceOrderEvent {
  final String firebaseUID;

  ViewOrders({
    @required this.firebaseUID,
  });
}
