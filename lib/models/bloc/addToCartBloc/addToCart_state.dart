part of 'addToCart_bloc.dart';

class CartProductData {
  final String productID;
  final int quantity;

  CartProductData({
    this.productID,
    this.quantity,
  });
}

class CartData {
  final String cartID;
  final String userID;
  final List<CartProductData> productsInCart;

  CartData({
    this.cartID,
    this.userID,
    this.productsInCart,
  });
}

class AddToCartState extends Equatable {
  final CartData cartData;

  AddToCartState({
    this.cartData,
  });

  @override
  List<Object> get props => [cartData];
}
