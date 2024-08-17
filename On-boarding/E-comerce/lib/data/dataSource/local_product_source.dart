import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/error/exception.dart';
import '../model/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductsModel>> getStoredProducts();
  Future<bool> storeProduct(List<ProductsModel> productToStore);
  Future<bool> deleteProduct(String Id);
  Future<ProductsModel> getSingleProduct(String Id);
  Future<bool> storeSingleProduct(ProductsModel updatedProduct);

}

class ProductLocalDataSourceImpl extends ProductLocalDataSource {
  final SharedPreferences store;

  ProductLocalDataSourceImpl({required this.store});

  @override
  Future<bool> storeProduct(List<ProductsModel> productsToStore) async {
    final List<String> jsonList = productsToStore.map((product) => jsonEncode(product.toJson())).toList();
    
    final success = await store.setStringList('savedProducts', jsonList);

  
    return success;
  }


 

  @override
  Future<List<ProductsModel>> getStoredProducts() async {

    final List<String>? jsonList = store.getStringList('savedProducts');
    
    if (jsonList == null) {
      return [];
    }
  
    final List<ProductsModel> products = jsonList.map((json) => ProductsModel.fromJson(jsonDecode(json))).toList();

    return products;
  }



  @override
  Future<bool> deleteProduct(String productId) async {
    final success = await store.setString(productId, '');
    return success;
  }

  @override
  Future<ProductsModel> getSingleProduct(String Id)async{
    final product = await store.getString(Id);  
    return ProductsModel.fromJson(jsonDecode(product.toString()));  
    
  }

  Future<bool> storeSingleProduct(ProductsModel product)async{
    final success = await store.setString(product.id, jsonEncode(product.toJson()));
    return success;
  
  }


 


}

