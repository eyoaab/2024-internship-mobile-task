import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../../core/constants/Url/url.dart';
import '../../../core/error/exception.dart';
import '../../../core/error/faliure.dart';
import '../../domain/entitiy/product_entities.dart';
import '../model/product_model.dart';
import '../model/ptoduct_to_save.dart';


abstract class ProductRemoteDataSource {  
  Future<ProductsModel> getProductById(String id);
  Future<Either<Failure, bool>> ProductAdd(SendProduct product,String token);
  Future<Either<Failure, bool>> ProductDelete(String productId,String token);
  Future<Either<Failure, bool>> ProductUpdate(String productId, ProductEnities product, String token);
  Future<Either<Failure, List<ProductsModel>>> getAllProduct(String token) ;

  // for user
// Future<Either<Failure, bool>> UserSignUp(UserEnities user);
//   Future<Either<Failure, bool>> UserLogIn(UserEnities user);

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
Future<Either<Failure, List<ProductsModel>>> getAllProduct(String token) async {
  try {
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token', 
  };

    
    final response = await client.get(
      headers: headers,
  Uri.parse(Urls.getAll())

);
print(response.statusCode);
    if (response.statusCode == 200) {

        // print(response.body);

      
      List<ProductsModel> modelList = parseProductList(response.body);
  
      return Right(modelList);
    } else {
     
      throw ServerException();
    }
  } catch (e, stackTrace) {
    print(e.toString());
    

    return Left(ServerFailure(e.toString()));
  }
}

    @override
  Future<Either<Failure, bool>> ProductUpdate(String productId, ProductEnities product,String token) async {
final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token', 
  };

    
    final Map<String, dynamic> data = {
      'name': product.name,
      'description': product.description,
      'price': product.price
    };  
    print(product);
 

    final response = await client.put(
      Uri.parse(Urls.updateProduct(productId)),
      body: json.encode(data),
      headers: headers,
    ); 
    // print('data on remote');
    // print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      print('product updated successfully');
    
      return const Right(true); 
    } else {
      print('product updated successfully');

     return const Right(false);
    }
        
  }


     @override
  Future<Either<Failure, bool>> ProductDelete(String productId,String token) async {
   

     final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token', 
  };
    final response = await client.delete(
      Uri.parse(Urls.deleteProduct(productId)),
       headers: headers,
    );    
    if (response.statusCode == 200) {
      print('product deleted successfully');
      
      return const Right(true); 
    } else {
      print('status code is not 200');
      print(response.statusCode);
      return const Right(false);    }    
  }
    @override




Future<Either<Failure, bool>> ProductAdd(SendProduct product,String token) async {
  try {
      // print('token in remorte add');
      // print(token);

    var request = http.MultipartRequest('POST', Uri.parse(Urls.addNewProduct()));
    request.headers['Authorization'] = 'Bearer $token';

      request.fields['name'] = product.name;
      request.fields['price'] = product.price.toString();
      request.fields['description'] = product.description;
      request.files.add(await http.MultipartFile.fromPath(
        'image', 
        product.image.path,
        contentType: MediaType('image','jpg')));

    
  
    
    var response = await request.send();


    if (response.statusCode == 201) {
      return const Right(true);
    } else {
      return const Right(false);

    }
  } catch (e) {
    return const Left(ServerFailure('Server Failure: ----'));
  }
}
//



List<ProductsModel> parseProductList(String jsonString) {

  final Map<String, dynamic> jsonResponse = json.decode(jsonString);

  if (jsonResponse['statusCode'] == 200 && jsonResponse['data'] != null) {
    final List<dynamic> data = jsonResponse['data'];
    return data.map((item) => ProductsModel.fromJson(item)).toList();
  } else {
    return [];
  }
}

// to user

// create a function for a sign up page with

}
