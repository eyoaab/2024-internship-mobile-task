
// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:dartz/dartz.dart';


import '../../../core/Network/networl_info.dart';
import '../../../core/error/exception.dart';
import '../../../core/error/faliure.dart';
import '../../domain/entitiy/product_entities.dart';
import '../../domain/repository/product_repository.dart';
import '../dataSource/local_product_source.dart';
import '../dataSource/remote_product_source.dart';
import '../model/product_model.dart';
import '../model/ptoduct_to_save.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';


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
      bool isConnected = await networkInfo.isConnected;
    if ( isConnected) {
      try {
        // List<ProductsModel> result = await localDataSource.getStoredProducts();
        // if (result.isNotEmpty){
        //   print('data from the repo locaal');
         
        //   return Right(result);
        // }

          final token = await localDataSource.getToken();
        // print('token in repository implmentation in delete');
        // print(token);



        print('no data is not from local');
        final remoteProducts = await remoteDataSource.getAllProduct(token!);

        remoteProducts.fold((left){}, 
        (rightProduct){
           Future<bool> x =  localDataSource.storeProduct(rightProduct);
           print('data saved fromm repo');
           
        });
       
       
       
      
        
        return remoteProducts ;
      } on ServerException {
        return const Left(ServerFailure('Failed to fetch data from server.'));
      }
    } else {
      print('there is no internet');
      try {
        final localProducts = await localDataSource.getStoredProducts();
        print(localProducts);
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
        final token = await localDataSource.getToken();
        bool success = false;
        // print('token in repository implmentation in delete');
        // print(token);

        final result = await remoteDataSource.ProductDelete(productId, token!);
        result.fold((error){
          success = false;
        },
         (answer){
          if (answer == true){
            success = true;
          }
          else{
            success = false;
          }
         });
       return Right(success);
       
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
        bool success = false;
        final token = await localDataSource.getToken();
        print("product on repo");
        print(product);

        final result = await remoteDataSource.ProductUpdate(productId,product,token!);
        result.fold((error){
          success = false;
        },
         (answer){
          success = answer;
         });
         return Right(success);

      } on ServerException {
        return const Left(ServerFailure('Failed to delete product'));
      }
    } else {
      return  const Left(ServerFailure('Failed to delete product'));

  }
      
    } 
  

  @override
  Future<Either<Failure,bool>> ProductAdd(SendProduct product)async{
    if (await networkInfo.isConnected) {
      try {
        final token = await localDataSource.getToken();
        final result = await remoteDataSource.ProductAdd(product,token!);

       bool success = false;
       result.fold((faliure){
        success = false;
       },
        (answer){
          success = true;
        });

        return Right(success);
      } on ServerException {
        return const Left(ServerFailure('Failed to add product'));
      }
    } else {
    return  const Left(ServerFailure('Failed to add product'));

  }
  }

//  @override
//   Future<Either<Failure, bool>> UserLogIn(UserEnities user)async{
//     if (await networkInfo.isConnected) {
//       try {
//         final result = await remoteDataSource.UserLogIn(user);
     
//         if(result == true) {
//           return  const Right(true);
//         }
//         else {
//           return  const Right(false);
//         } 
//       } on ServerException {
//         return const Left(ServerFailure('Failed to log in user'));
//       }
//     } else {
//       return  const Left(ServerFailure('Failed to log in user'));
//     }
//   }
  // @override
  // Future<Either<Failure, bool>> UserSignUp(UserEnities user)async{


  //       final result = await remoteDataSource.UserSignUp(user);
      
        
  //       result.fold(
  //         (fail){return const Left(ServerFailure);},
  //        (right){return Right(right);});

     
  //       return const Left(ServerFailure('Failed to log in user'));
  //     }
    } 
  