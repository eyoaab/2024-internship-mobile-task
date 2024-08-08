import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_6/core/error/exception.dart';
import '../model/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductsModel>> getStoredProducts();
  Future<bool> storeProduct(ProductsModel productToStore);
}

class ProductLocalDataSourceImpl extends ProductLocalDataSource {
  final SharedPreferences store;

  ProductLocalDataSourceImpl({required this.store});
  //constructor for the implmentation class it needs a shared preferance to store and retrive data

  @override
  Future<bool> storeProduct(ProductsModel productToStore) async {
    final List<String> jsonList = store.getStringList('savedProducts') ?? [];
    //taking the previous list from the store if there otherwise taking an empty list
    
    final productJson = jsonEncode(productToStore.toJson());
    //converting the product model to a json object for storing properly
    jsonList.add(productJson);

    final success = await store.setStringList('savedProducts', jsonList);
    // saving thre new list
      print(success);

    if (!success){
      // print(success);
      return false;
    }
    return true;
  }

  // method to get saved products

  @override
  Future<List<ProductsModel>> getStoredProducts() async {
    final jsonList = store.getStringList('savedProducts');

    if (jsonList != null) {
      return jsonList
          .map((jsonString) => ProductsModel.fromJson(jsonDecode(jsonString)))
          .toList();
    }

    throw CacheException();
  }
}
