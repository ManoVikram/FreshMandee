part of 'userCart_bloc.dart';

abstract class UserCartState extends Equatable {
  const UserCartState();

  @override
  List<Object> get props => [];
}

class UserCartInitial extends UserCartState {}

class AddToCartState extends UserCartState {
  final String firebaseUID;
  final List<Map<String, dynamic>> cartItems;

  AddToCartState({
    this.firebaseUID,
    this.cartItems,
  });
}

class RemoveFromCartState extends UserCartState {}

class ViewCartState extends UserCartState {
  final List<Map<String, dynamic>> cartItems;

  ViewCartState({
    this.cartItems,
  });
}
