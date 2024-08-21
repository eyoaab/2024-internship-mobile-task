import 'package:dartz/dartz.dart';

import '../../../core/error/faliure.dart';
import '../Entities/user_entities.dart';
import '../Repository/user_repository.dart';



class LoginUseCase {
  final UserRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, bool>> call(UserEnities user) async {
    final result =  await repository.logIn(user);
   
    return result;
  }
}
