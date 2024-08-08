import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task_6/core/error/faliure.dart';
import 'package:task_6/domain/entitiy/product_entities.dart';
import 'package:task_6/domain/repository/product_repository.dart';

class UpdateProductUsecase extends Equatable{

  final int id;
  final ProductRepository productRepository;
  const UpdateProductUsecase({required this.id, required this.productRepository});


/// call_ is a prefix i add to mention thet it is a call by the usecase
/// i have added this call in all use cases
  Future<Either<Failure, bool>> call_update(int productId, ProductEnities product){

    return productRepository.ProductUpdate(productId,product);
  }
  @override
  List<Object> get props => [id];

}