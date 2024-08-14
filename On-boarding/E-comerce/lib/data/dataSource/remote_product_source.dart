import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/Url/url.dart';
import '../../core/error/exception.dart';
import '../../core/error/faliure.dart';
import '../../domain/entitiy/product_entities.dart';
import '../model/product_model.dart';


abstract class ProductRemoteDataSource {
  Future<ProductsModel> getProductById(String id);
  Future<Either<Failure, bool>> ProductAdd(ProductEnities product);
  Future<Either<Failure, bool>> ProductDelete(String productId);
  Future<Either<Failure, bool>> ProductUpdate(String productId, ProductEnities product);
  Future<Either<Failure, List<ProductsModel>>> getAllProduct() ;
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final http.Client client;
  ProductRemoteDataSourceImpl( this.client);

  @override
  Future<ProductsModel> getProductById(String id) async {
    final response = await client.get(Uri.parse(Urls.getByUrl(id)));

    if (response.statusCode == 200) {
      return ProductsModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }



  @override
Future<Either<Failure, List<ProductsModel>>> getAllProduct() async {
  try {

    
    final response = await client.get(
  Uri.parse(Urls.getAll())
);

    
    if (response.statusCode == 200) {
      
      List<ProductsModel> modelList = parseProductList(response.body);

      

      return Right(modelList);
    } else {
     
      throw ServerException();
    }
  } catch (e, stackTrace) {
    

    return Left(ServerFailure(e.toString()));
  }
}

    @override
  Future<Either<Failure, bool>> ProductUpdate(String productId, ProductEnities product) async {
    final Map<String, String> data = {
      'id':product.id.toString(),
      'image': product.imageUrl,
      'name': product.name,
      'description': product.description,
      'price': '${product.price}'
    };

    final response = await client.put(
      Uri.parse(Urls.updateProduct(productId)),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );    
    if (response.statusCode == 200) {
    
      return const Right(true); 
    } else {
      throw ServerException();
    }
        
  }


     @override
  Future<Either<Failure, bool>> ProductDelete(String productId,) async {
    final response = await client.put(
      Uri.parse(Urls.deleteProduct(productId)),
      body:productId.toString(),
      headers: {'Content-Type': 'application/json'},
    );    
    if (response.statusCode == 200) {
      
      return const Right(true); 
    } else {
      throw ServerException();
    }    
  }
    @override
  Future<Either<Failure, bool>> ProductAdd(ProductEnities product,) async {

 final Map<String, String> data = {
      'image': product.imageUrl,
      'name': product.name,
      'description': product.description,
      'price': '${product.price}'
    };
    
    final response = await client.put(
      Uri.parse(Urls.addNewProduct()),
      body: data,

    );  
    if (response.statusCode == 200) {
     
      return const Right(true); 
    } else {
      throw ServerException();
    }
        
  }



}







List<ProductsModel> parseProductList(String jsonString) {
  final Map<String, dynamic> jsonResponse = json.decode(jsonString);

  if (jsonResponse['statusCode'] == 200 && jsonResponse['data'] != null) {
    final List<dynamic> data = jsonResponse['data'];
    return data.map((item) => ProductsModel.fromJson(item)).toList();
  } else {
    return [];
  }
}