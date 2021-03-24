part of 'productsUnderCategory_bloc.dart';

class ProductData {
  final String productID;
  final String categoryID;
  final String name;
  final String description;
  final String image;
  final int discount;
  final int price;

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
