import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task_6/core/error/faliure.dart';
import 'package:task_6/design/entitiy/product_entities.dart';
import 'package:task_6/design/repository/product_repository.dart';

class UpdateProductUsecase extends Equatable{

  final int id;
  final ProductRepository productRepository;
  const UpdateProductUsecase({required this.id, required this.productRepository});


/// call_ is a prefix i add to mention thet it is a call by the usecase
  Future<Either<Failure, ProductEnities>> call_update(int productId, ProductEnities product){

    return productRepository.ProductUpdate(productId,product);
  }
  @override
  List<Object> get props => [id];

}