

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/faliure.dart';
import '../entitiy/product_entities.dart';
import '../repository/product_repository.dart';

class AllProductUsecase extends Equatable{

  final ProductRepository productRepository;
  const AllProductUsecase( this.productRepository);

  Future<Either<Failure, List<ProductEnities>>> call_AllProducts(){
    return productRepository.getAllProducts();
    
  }

   @override
  List<Object> get props => [productRepository];


 
}