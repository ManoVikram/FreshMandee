part of 'productsUnderCategory_bloc.dart';

class ProductsUnderCategoryState extends Equatable {
  final List<dynamic> products;

  ProductsUnderCategoryState({
    this.products,
  });

  @override
  List<Object> get props => [products];
}
