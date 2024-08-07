import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_6/core/error/exception.dart';

import '../model/product_model.dart';



abstract class ProductLocalDataSource {
  Future<List<ProductsModel>> getCachedProducts();
  Future<bool> cacheProduct(ProductsModel productToCache);
}

class ProductLocalDataSourceImpl extends ProductLocalDataSource {
  final SharedPreferences pref;

  ProductLocalDataSourceImpl({required this.pref});
  @override
  Future<bool> cacheProduct(ProductsModel productToCache) {
    throw UnimplementedError();
  }

  @override
  Future<List<ProductsModel>> getCachedProducts() {
    final jsonList = pref.getStringList('cachedProduct');

    if (jsonList != null) {
      return Future.value(jsonList
          .map((jsonString) => ProductsModel.fromJson(jsonDecode(jsonString)))
          .toList());
    }

    throw CacheException();
  }
}