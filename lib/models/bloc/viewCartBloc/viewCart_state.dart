part of 'viewCart_bloc.dart';

class ProductData {
  final String productID;
  final int quantity;

  ProductData({
    this.productID,
    this.quantity,
  });
}

class ViewCartState extends Equatable {
  final List<ProductData> cartProducts;
  final String comment;

  ViewCartState({
    this.cartProducts,
    this.comment,
  });

  @override
  List<Object> get props => [cartProducts, comment];
}
