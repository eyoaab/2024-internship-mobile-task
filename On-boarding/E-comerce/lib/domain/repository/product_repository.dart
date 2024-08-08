

import 'package:dartz/dartz.dart';

import '../../core/error/faliure.dart';
import '../entitiy/product_entities.dart';

abstract class ProductRepository {



  //added a future methods for implmenting later 
//The future shows they will implment later(they are asynchronous)
//the thing in the "<>" shows their return type when they implment later
// this is just a contract for the future implmented methods



  Future<Either<Failure, List<ProductEnities>>> getAllProducts();
  Future<Either<Failure,ProductEnities>> getProductById(int productId);
  Future<Either<Failure,bool>> ProductUpdate(int productId, ProductEnities product);
  Future<Either<Failure,bool>> ProductDelete(int productId);
  Future<Either<Failure,bool>> ProductAdd(ProductEnities product);

// now we can call this in the usecase and implment it in the data layer

}