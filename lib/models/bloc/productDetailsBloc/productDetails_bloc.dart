import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../../GlobalConfig.dart';

part 'productDetails_event.dart';
part 'productDetails_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc() : super(ProductDetailsState());

  @override
  Stream<ProductDetailsState> mapEventToState(
      ProductDetailsEvent event) async* {
    if (event is FetchProductDetails) {
      const String url = "http://$API_HOST/api/category/product/view";

      final response = await http.post(
        url,
        body: {
          "firebaseUID": event.firebaseUID,
          "productID": event.productID,
        },
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      ProductData loadedData = ProductData(
        productID: extractedData["_id"],
        categoryID: extractedData["categoryID"],
        name: extractedData["name"],
        description: extractedData["description"],
        image: extractedData["image"],
        price: extractedData["price"],
        discount: extractedData["discount"],
      );

      yield ProductDetailsState(productData: loadedData);
    }
  }
}
