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
    const String url = "http://$API_HOST/api/category/all";

    if (event is ShowAllCategories) {
      final response = await http.post(
        url,
        body: {
          "firebaseUID": event.firebaseUID,
        },
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      CategoryData loadedData = CategoryData(
        name: extractedData["name"],
        image: extractedData["image"],
      );

      yield AllCategoriesState(
        categoryData: loadedData,
      );
    }
  }
}
