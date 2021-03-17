part of 'productsUnderCategory_bloc.dart';

abstract class ProductsUnderCategoryEvent {
  const ProductsUnderCategoryEvent();

  @override
  List<Object> get props => [];
}

class FetchProducts extends ProductsUnderCategoryEvent {
  final String firebaseUID;
  final String categoryID;

  const FetchProducts({
    @required this.firebaseUID,
    @required this.categoryID,
  });
}
