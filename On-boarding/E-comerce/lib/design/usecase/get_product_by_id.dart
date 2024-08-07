import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task_6/core/error/faliure.dart';
import 'package:task_6/design/entitiy/product_entities.dart';
import 'package:task_6/design/repository/product_repository.dart';

class ShowProductById extends Equatable{
  final int id;
  final ProductRepository productRepository;
  const ShowProductById({required this.id,required this.productRepository});

  Future<Either<Failure,ProductEnities>> show(int productId){
    return productRepository.getProductById(productId);

  }

  @override
  List<Object> get props => [];

}