import 'package:dartz/dartz.dart';

import '../../../core/error/faliure.dart';
import '../Entities/user_entities.dart';
import '../Repository/user_repository.dart';


class SignUpUseCase {
  final UserRepository repository;

  SignUpUseCase(this.repository);

  Future<Either<Failure, bool>> call(UserEnities user) async {
    return await repository.signUp(user);
  }
}