

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/error/faliure.dart';
import '../entitiy/user_entities.dart';
import '../repository/product_repository.dart';

class SignUp extends Equatable{

  final ProductRepository productRepository;
  const SignUp( this.productRepository);

  Future<Either<Failure, bool>> call_SignUp( UserEnities user){
    return productRepository.UserSignUp(user);
    
  }

   @override
  List<Object> get props => [productRepository];


 
}