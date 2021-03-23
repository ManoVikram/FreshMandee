part of 'allCategories_bloc.dart';

class CategoryData {
  final String categoryID;
  final String name;
  final String image;

  CategoryData({
    @required this.categoryID,
    @required this.name,
    @required this.image,
  });
}

class AllCategoriesState extends Equatable {
  final List<CategoryData> categoryData;

  const AllCategoriesState({
    this.categoryData,
  });

  @override
  List<Object> get props => [];
}
