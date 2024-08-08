/// this page is the implmentation for the above repository(in a domain layer)

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
  // the remote data source fo fatching the products from the sremote erver
  final ProductLocalDataSource localDataSource;
  // a local data source fo fatching the products if the user dosnt have an internet connection
  final NetworkInfo networkInfo;
  // for detecting weather the user  is connected or not

  ProductRepositoryImpl({//constructor for the repository
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ProductsModel>>> getAllProducts() async {
    // just call the function to get all products from network or local daata
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await remoteDataSource.getAllProduct();
        // localDataSource.storeProduct(remoteProducts[0]);
        return  Right(remoteProducts as List<ProductsModel>);
      } on ServerException {
        return const Left(ServerFailure('Failed to fetch data from server.'));
      }
    } else {
      // if there is no connection available
      try {
        final localProducts = await localDataSource.getStoredProducts();
        return Right(localProducts);
      } on CacheException {
        return const Left(CacheFailure('No stored data available.'));
      }
    }
  }
  
  @override
  Future<Either<Failure,ProductEnities>> getProductById(int productId) async{
    // just call the function to get all products from network or local daata
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await remoteDataSource.getProductById(productId);
        // localDataSource.storeProduct(remoteProducts[0]);
        return  Right(remoteProducts);
      } on ServerException {
        return const Left(ServerFailure('Failed to fetch data from server.'));
      }
    } else {
      // if there is no connection available
      // try {
      //   final localProducts = await localDataSource();
      //   return Right(localProducts);
      // } on CacheException {
      //   return const Left(CacheFailure('No stored data available.'));
      // }
      return (const Left(NetworkFailure('No internet connection.')));
    }

  }


  @override
  Future<Either<Failure,bool>> ProductDelete(int productId)async{
     if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.ProductDelete(productId);
        if(result == true) {
          return  const Right(true);
        }
        else {
          return  const Right(false);
        } 
       
      } on ServerException {
        return const Left(ServerFailure('Failed to delete product'));
      }
    } else {
      return  const Left(ServerFailure('Failed to delete product'));

  }}
  

 @override
  Future<Either<Failure,bool>> ProductUpdate(int productId, ProductEnities product) async{
      if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.ProductUpdate(productId,product);
        if (result == true){
            return  const Right(true);
        }
        else{
          return  const Right(false);
        }
      } on ServerException {
        return const Left(ServerFailure('Failed to fetch data from server.'));
      }
    } else {
      return const Left(ConnectionFailure('connection error'));
    }
  }

  @override
  Future<Either<Failure,bool>> ProductAdd(ProductEnities product )async{
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.ProductAdd(product);
        if(result == true) {
          return  const Right(true);
        }
        else {
          return  const Right(false);
        } 
      } on ServerException {
        return const Left(ServerFailure('Failed to add product'));
      }
    } else {
      return  const Left(ServerFailure('Failed to add product'));

  }

 


  }

}