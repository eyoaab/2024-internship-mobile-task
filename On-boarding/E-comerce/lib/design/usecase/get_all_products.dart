

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task_6/core/error/faliure.dart';
import 'package:task_6/design/entitiy/product_entities.dart';
import 'package:task_6/design/repository/product_repository.dart';

class AllProductUsecase extends Equatable{

  final ProductRepository productRepository;
  const AllProductUsecase({required this.productRepository});

  Future<Either<Failure, List<ProductEnities>>> call_AllProducts(){
    return productRepository.getAllProducts();
  }

   @override
  List<Object> get props => [productRepository];


 
}