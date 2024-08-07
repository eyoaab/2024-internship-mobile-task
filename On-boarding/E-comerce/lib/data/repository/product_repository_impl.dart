import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:task_6/core/error/exception.dart';
import 'package:task_6/core/error/faliure.dart';
import 'package:task_6/data/dataSource/remote_product_source.dart';
import 'package:task_6/domain/repository/product_repository.dart';

import '../../domain/entitiy/product_entities.dart';

class ProductRepositoryImpl extends ProductRepository {
  late ProductRemoteDataSource productRemoteDataSource;
  ProductRepositoryImpl({required this.productRemoteDataSource});

  @override
  Future<Either<Failure, void>> deleteProduct(int id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ProductEnities>> getProduct(String id) async {
    try {
      final result = await productRemoteDataSource.getProductById(id as int);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, void>> insertProduct(ProductEnities product) {
    // TODO: implement insertProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateProduct(ProductEnities product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, ProductEnities>> ProductAdd(ProductEnities product) {
    // TODO: implement ProductAdd
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, ProductEnities>> ProductDelete(int productId) {
    // TODO: implement ProductDelete
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, ProductEnities>> ProductUpdate(int productId, ProductEnities product) {
    // TODO: implement ProductUpdate
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<ProductEnities>>> getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, ProductEnities>> getProductById(int productId) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }
}