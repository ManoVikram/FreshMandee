part of 'productsUnderCategory_bloc.dart';

class ProductData {
  final dynamic productID;
  final dynamic categoryID;
  final dynamic name;
  final dynamic description;
  final dynamic image;
  final dynamic discount;
  final dynamic price;

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

class ProductsUnderCategoryState extends Equatable {
  final List<ProductData> products;

  ProductsUnderCategoryState({
    this.products,
  });

  @override
  List<Object> get props => [products];
}
