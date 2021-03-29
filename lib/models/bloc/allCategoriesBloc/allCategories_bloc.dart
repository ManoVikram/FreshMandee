import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../../GlobalConfig.dart';

part 'allCategories_event.dart';
part 'allCategories_state.dart';

class AllCategoriesBloc extends Bloc<AllCategoriesEvent, AllCategoriesState> {
  AllCategoriesBloc() : super(AllCategoriesState());

  @override
  Stream<AllCategoriesState> mapEventToState(AllCategoriesEvent event) async* {
    // const String url = "http://$API_HOST/api/category/all";
    const String url =
        "https://pacific-shore-21505.herokuapp.com/api/category/all";

    if (event is ShowAllCategories) {
      final response = await http.post(
        url,
        body: {
          "firebaseUID": event.firebaseUID,
        },
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      print(extractedData);

      List<CategoryData> loadedData = [];
      for (var i = 0; i < extractedData["categories"].length; i++) {
        CategoryData categoryData = CategoryData(
          categoryID: extractedData["categories"][i]["_id"],
          name: extractedData["categories"][i]["name"],
          image: extractedData["categories"][i]["image"],
        );

        loadedData.add(categoryData);
      }

      print(loadedData);

      yield AllCategoriesState(
        categoryData: loadedData,
      );
    }
  }
}
