import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/constants/Url/url.dart';
import '../../../../core/error/faliure.dart';
import '../../../Domain/Entities/user_entities.dart';

abstract class UserRemoteDataSource {
  Future<Either<Failure, bool>> userSignUp(UserEnities user);
  Future<Either<Failure, String>> userLogIn(UserEnities user);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  UserRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<Either<Failure, bool>> userSignUp(UserEnities user) async {
    try {
      final response = await client.post(
        Uri.parse(Urls.SignUp()),
        body: {
          'name': user.name,
          'email': user.username,
          'password': user.password,
        },
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      );
        // print('response for sign up');
        // print(response.statusCode);
      if (response.statusCode == 201) {
       
        return const Right(true);
      } else {
        return const Right(false);
      }
    } catch (e) {
      return Left(ServerFailure('Failed to sign up: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, String>> userLogIn(UserEnities user) async {
    try {
      final response = await client.post(
        Uri.parse(Urls.Login()),
        body: {
          'email': user.username,
          'password': user.password,  
        },
      );
   

      if (response.statusCode == 201) {
        final responseData = json.decode(response.body);
        final String token = responseData['data']['access_token'];
   
        return  Right(token);
      } else {
        return  const Right('');
      }
    } catch (e) {
      return Left(ServerFailure('Failed to log in: ${e.toString()}'));
    }
  }
}