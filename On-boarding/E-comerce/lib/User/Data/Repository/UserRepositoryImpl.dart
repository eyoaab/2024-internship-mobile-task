import 'package:dartz/dartz.dart';

import '../../../../core/Network/networl_info.dart';
import '../../../core/error/faliure.dart';
import '../../Domaign/Entities/user_entities.dart';
import '../../Domaign/Repository/user_repository.dart';
import '../DataSource/LocalDataSource/LocalDataSource.dart';
import '../DataSource/RemoteDataSource/RemoteDateSource.dart';

class Userrepositoryimpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  Userrepositoryimpl({
    required this.userRemoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, bool>> signUp(UserEnities user) async {
    if (await networkInfo.isConnected) {
      return await userRemoteDataSource.userSignUp(user);
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, bool>> logIn(UserEnities user) async {
    if (await networkInfo.isConnected) {
      final result = await userRemoteDataSource.userLogIn(user);
      bool value = false;


      result.fold((error){return const Left(ServerFailure('cant get the token'));}, 
      (token){
        if(token.isEmpty){
          value = false;
        }
        else{
          localDataSource.saveToken(token);
          value = true;
        }
      });

      return  Right(value);
     
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<void> logOut() async {
    await localDataSource.clearToken();
  }

  @override
  Future<Either<Failure, String?>> getToken() async {
    final token = await localDataSource.getToken();
    if (token != null) {
      return Right(token);
    } else {
      return const Left(CacheFailure('No token found'));
    }
  }
}
