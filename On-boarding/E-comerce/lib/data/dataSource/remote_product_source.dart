import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task_6/core/constants/Url/url.dart';
import 'package:task_6/core/error/exception.dart';

import '../model/product_model.dart';


abstract class ProductRemoteDataSource {
  Future<ProductsModel> getProductById(int id);
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final http.Client client;
  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<ProductsModel> getProductById(int id) async {
    final response = await client.get(Uri.parse(Urls.getProduct(id)));

    if (response.statusCode == 200) {
      return ProductsModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}