

import 'package:dartz/dartz.dart';

import '../../../core/error/faliure.dart';
import '../../data/model/ptoduct_to_save.dart';
import '../entitiy/product_entities.dart';

abstract class ProductRepository {


  Future<Either<Failure, List<ProductEnities>>> getAllProducts();
  Future<Either<Failure,ProductEnities>> getProductById(String productId);
  Future<Either<Failure,bool>> ProductUpdate(String productId, ProductEnities product);
  Future<Either<Failure,bool>> ProductDelete(String productId);
  Future<Either<Failure,bool>> ProductAdd(SendProduct product);



}