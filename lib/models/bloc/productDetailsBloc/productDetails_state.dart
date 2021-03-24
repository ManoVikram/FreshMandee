part of 'productDetails_bloc.dart';

class ProductData {
  final String productID;
  final String categoryID;
  final String name;
  final String description;
  final String image;
  final dynamic price;
  final dynamic discount;

  ProductData({
    this.productID,
    this.categoryID,
    this.name,
    this.description,
    this.image,
    this.price,
    this.discount,
  });
}

class ProductDetailsState extends Equatable {
  final ProductData productData;

  ProductDetailsState({
    this.productData,
  });

  @override
  List<Object> get props => [productData];
}
