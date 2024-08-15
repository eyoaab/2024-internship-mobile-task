import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/error/exception.dart';
import '../model/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductsModel>> getStoredProducts();
  Future<bool> storeProduct(List<ProductsModel> productToStore);
}

class ProductLocalDataSourceImpl extends ProductLocalDataSource {
  final SharedPreferences store;

  ProductLocalDataSourceImpl({required this.store});

  @override
  Future<bool> storeProduct(List<ProductsModel> productsToStore) async {
    final List<String> jsonList = productsToStore.map((product) => jsonEncode(product.toJson())).toList();
    
    final success = await store.setStringList('savedProducts', jsonList);
    print('in local');
    print(success);
  
    return success;
  }


 

  @override
  Future<List<ProductsModel>> getStoredProducts() async {
    // Get the JSON list from shared preferences
    final List<String>? jsonList = store.getStringList('savedProducts');
     


    if (jsonList == null) {
      return [];
    }

    // Convert the JSON strings back to ProductsModel objects
    final List<ProductsModel> products = jsonList.map((json) => ProductsModel.fromJson(jsonDecode(json))).toList();

    return products;
  }
}

