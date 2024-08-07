

import 'package:dartz/dartz.dart';

import '../../core/error/faliure.dart';
import '../entitiy/product_entities.dart';

abstract class ProductRepository {



  //added a future methods for implmenting later 
//The future shows they will implment later(they are asynchronous)
//the thing in the "<>" shows their return type when they implment later

  Future<Either<Failure, List<ProductEnities>>> getAllProducts();
  Future<Either<Failure,ProductEnities>> getProductById(int productId);
  Future<Either<Failure,ProductEnities>> ProductUpdate(int productId, ProductEnities product);
  Future<Either<Failure,ProductEnities>> ProductDelete(int productId);
  Future<Either<Failure,ProductEnities>> ProductAdd(ProductEnities product);

// now we can implmetnt this in the usecase one by one

}