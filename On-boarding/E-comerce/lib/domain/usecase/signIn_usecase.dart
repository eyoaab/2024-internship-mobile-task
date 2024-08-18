

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/error/faliure.dart';
import '../entitiy/user_entities.dart';
import '../repository/product_repository.dart';

class SignUpUswcase extends Equatable{

  final ProductRepository productRepository;
  const SignUpUswcase( this.productRepository);

  Future<Either<Failure, bool>> call_SignUp( UserEnities user){
    print('usecase sign up called');
    return productRepository.UserSignUp(user);
    
  }

   @override
  List<Object> get props => [productRepository];


 
}