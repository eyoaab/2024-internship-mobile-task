
import 'package:dartz/dartz.dart';

import '../../core/Network/networl_info.dart';
import '../../core/error/exception.dart';
import '../../core/error/faliure.dart';
import '../../domain/entitiy/product_entities.dart';
import '../../domain/repository/product_repository.dart';
import '../dataSource/local_product_source.dart';
import '../dataSource/remote_product_source.dart';
import '../model/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl(
     {required this.remoteDataSource,
     required this.localDataSource,
     required this.networkInfo,}
  );

  @override
  Future<Either<Failure, List<ProductsModel>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await remoteDataSource.getAllProduct();
        return remoteProducts ;
      } on ServerException {
        return const Left(ServerFailure('Failed to fetch data from server.'));
      }
    } else {
      try {
        final localProducts = await localDataSource.getStoredProducts();
        return Right(localProducts);
      } on CacheException {
        return const Left(CacheFailure('No stored data available.'));
      }
    }
  }
  
  @override
  Future<Either<Failure,ProductEnities>> getProductById(String productId) async{
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await remoteDataSource.getProductById(productId);
        return  Right(remoteProducts);
      } on ServerException {
        return const Left(ServerFailure('Failed to fetch data from server.'));
      }
    } else {
     
      return (const Left(NetworkFailure('No internet connection.')));
    }

  }


  @override
  Future<Either<Failure,bool>> ProductDelete(String productId)async{
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
  Future<Either<Failure,bool>> ProductUpdate(String productId, ProductEnities product) async{
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