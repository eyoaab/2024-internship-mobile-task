

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/error/faliure.dart';
import '../entitiy/user_entities.dart';
import '../repository/product_repository.dart';

class LoginUsecase extends Equatable{

  final ProductRepository productRepository;
  const LoginUsecase( this.productRepository);

  Future<Either<Failure, bool>> call_login( UserEnities user){
    return productRepository.UserLogIn(user);
    
  }

   @override
  List<Object> get props => [productRepository];


 
}