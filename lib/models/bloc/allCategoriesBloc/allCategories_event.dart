part of 'allCategories_bloc.dart';

abstract class AllCategoriesEvent {
  const AllCategoriesEvent();

  @override
  List<Object> get props => [];
}

class ShowAllCategories extends AllCategoriesEvent {
  final String firebaseUID;

  const ShowAllCategories({
    @required this.firebaseUID,
  });
}
