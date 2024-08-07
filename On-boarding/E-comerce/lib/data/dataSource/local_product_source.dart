import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_6/core/error/exception.dart';
import '../model/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductsModel>> getCachedProducts();
  Future<bool> cacheProduct(ProductsModel productToCache);
}

class ProductLocalDataSourceImpl extends ProductLocalDataSource {
  final SharedPreferences store;

  ProductLocalDataSourceImpl({required this.store});

  @override
  Future<bool> cacheProduct(ProductsModel productToCache) async {
    final List<String> jsonList = store.getStringList('cachedProducts') ?? [];
    
    final productJson = jsonEncode(productToCache.toJson());
    jsonList.add(productJson);

    final success = await store.setStringList('cachedProducts', jsonList);
      print(success);

    if (!success){
      // print(success);
      return false;
    }
    return true;
  }

  @override
  Future<List<ProductsModel>> getCachedProducts() async {
    final jsonList = store.getStringList('cachedProducts');

    if (jsonList != null) {
      return jsonList
          .map((jsonString) => ProductsModel.fromJson(jsonDecode(jsonString)))
          .toList();
    }

    throw CacheException();
  }
}
