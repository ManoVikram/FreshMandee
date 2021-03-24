import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../../GlobalConfig.dart';

part 'productsUnderCategory_event.dart';
part 'productsUnderCategory_state.dart';

class ProductsUnderCategoryBloc
    extends Bloc<ProductsUnderCategoryEvent, ProductsUnderCategoryState> {
  ProductsUnderCategoryBloc() : super(ProductsUnderCategoryState());

  @override
  Stream<ProductsUnderCategoryState> mapEventToState(
      ProductsUnderCategoryEvent event) async* {
    const String url = "http://$API_HOST/api/category/product/all";

    if (event is FetchProducts) {
      final response = await http.post(
        url,
        body: {
          "firebaseUID": event.firebaseUID,
          "categoryID": event.categoryID,
        },
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      List<ProductData> loadedData = [];
      for (var i = 0; i < extractedData["products"].length; i++) {
        ProductData productData = ProductData(
          productID: extractedData["products"]["_id"],
          categoryID: extractedData["products"]["categoryID"],
          name: extractedData["products"]["name"],
          description: extractedData["products"]["description"],
          image: extractedData["products"]["image"],
          price: extractedData["products"]["price"],
          discount: extractedData["products"]["discount"],
        );

        loadedData.add(productData);
      }

      yield ProductsUnderCategoryState(
        products: loadedData,
      );
    }
  }
}
