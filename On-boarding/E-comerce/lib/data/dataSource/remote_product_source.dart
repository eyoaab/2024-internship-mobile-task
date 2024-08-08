import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:task_6/core/constants/Url/url.dart';
import 'package:task_6/core/error/exception.dart';
import 'package:task_6/domain/entitiy/product_entities.dart';

import '../../core/error/faliure.dart';
import '../model/product_model.dart';


abstract class ProductRemoteDataSource {
  Future<ProductsModel> getProductById(int id);
  Future<Either<Failure, bool>> ProductAdd(ProductEnities product);
  Future<Either<Failure, bool>> ProductDelete(int productId);
  Future<Either<Failure, bool>> ProductUpdate(int productId, ProductEnities product);
   Future<Either<Failure, List<ProductsModel>>> getAllProduct() ;
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


  // to get all products from the store
    static const testUrl  = "https://g5-flutter-learning-path-be.onrender.com/api/v1/products";

  @override
    Future<Either<Failure, List<ProductsModel>>> getAllProduct() async {
    final response = await client.get(Uri.parse(testUrl));
    if (response.statusCode == 200) {
      print("/////");
      print(json.decode(response.body));
      
      return Right(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
    
    // to update a product
    @override
  Future<Either<Failure, bool>> ProductUpdate(int productId, ProductEnities product) async {
    final Map<String, String> data = {
      'image': product.imageUrl,
      'name': product.name,
      'description': product.description,
      'price': '${product.price}'
    };

    final response = await client.put(
      Uri.parse('url to upddate product'),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );    
    if (response.statusCode == 200) {
      // return ProductsModel.fromJson(json.decode(response.body));
      // retu
      return const Right(true); 
    } else {
      throw ServerException();
    }
        
  }

  // to delete a product

     @override
  Future<Either<Failure, bool>> ProductDelete(int productId,) async {
    final response = await client.put(
      Uri.parse('url to upddate product'),
      headers: {'Content-Type': 'application/json'},
    );    
    if (response.statusCode == 200) {
      // return ProductsModel.fromJson(json.decode(response.body));
      
      return Right(true); 
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
      Uri.parse('url to add product'),
      headers: data,

    );  
    if (response.statusCode == 200) {
     
      return const Right(true); 
    } else {
      throw ServerException();
    }
        
  }



}


