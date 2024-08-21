import 'package:dartz/dartz.dart';

import '../../../core/error/faliure.dart';
import '../Entities/user_entities.dart';


abstract class UserRepository {
  Future<Either<Failure, bool>> signUp(UserEnities user);
  Future<Either<Failure, bool>> logIn(UserEnities user);
  Future<void> logOut();
  Future<Either<Failure, String?>> getToken();
}
