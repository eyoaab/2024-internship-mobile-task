import 'package:dartz/dartz.dart';
import 'package:task_6/core/Network/networl_info.dart';
import 'package:task_6/core/error/exception.dart';
import 'package:task_6/core/error/faliure.dart';
import 'package:task_6/data/dataSource/local_product_source.dart';
import 'package:task_6/data/dataSource/remote_product_source.dart';
import 'package:task_6/domain/entitiy/product_entities.dart';
import 'package:task_6/domain/repository/product_repository.dart';

import '../model/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ProductsModel>> getProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await remoteDataSource.getProductById(12);
        localDataSource.cacheProduct(remoteProducts);
        return  Right(remoteProducts);
      } on ServerException {
        return const Left(ServerFailure('Failed to fetch data from server.'));
      }
    } else {
      try {
        final localProducts = await localDataSource.getCachedProducts();
        return Right(localProducts[0]);
      } on CacheException {
        return const Left(CacheFailure('No cached data available.'));
      }
    }
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
