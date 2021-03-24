part of 'productDetails_bloc.dart';

abstract class ProductDetailsEvent {
  const ProductDetailsEvent();

  @override
  List<Object> get props => [];
}

class FetchProductDetails extends ProductDetailsEvent {
  final String firebaseUID;
  final String categoryID;
  final String productID;

  const FetchProductDetails({
    @required this.firebaseUID,
    @required this.categoryID,
    @required this.productID,
  });
}
