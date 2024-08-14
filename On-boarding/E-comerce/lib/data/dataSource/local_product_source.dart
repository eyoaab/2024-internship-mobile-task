import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/error/exception.dart';
import '../model/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductsModel>> getStoredProducts();
  Future<bool> storeProduct(ProductsModel productToStore);
}

class ProductLocalDataSourceImpl extends ProductLocalDataSource {
  final SharedPreferences store;

  ProductLocalDataSourceImpl({required this.store});

  @override
  Future<bool> storeProduct(ProductsModel productToStore) async {
    final List<String> jsonList = store.getStringList('savedProducts') ?? [];  
    final productJson = jsonEncode(productToStore.toJson());
    jsonList.add(productJson);

    final success = await store.setStringList('savedProducts', jsonList);

    if (!success){
      return false;
    }
    return true;
  }

 

  @override
  Future<List<ProductsModel>> getStoredProducts() async {
    final jsonList = store.getStringList('savedProducts');

    if (jsonList != null) {
      return jsonList
          .map((jsonString) => ProductsModel.fromJson(jsonDecode(jsonString)))
          .toList();
    }else{
    throw CacheException();

    }

  }
}
