import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task_6/core/error/faliure.dart';
import 'package:task_6/domain/entitiy/product_entities.dart';
import 'package:task_6/domain/repository/product_repository.dart';

class DeleteProductbyidUsecase  extends Equatable {

    final ProductRepository productRepository;
    final int id;
    const DeleteProductbyidUsecase({required this.productRepository,required this.id});

    Future<Either<Failure, bool>> call_delete(int productId){
      return productRepository.ProductDelete(productId);
    }
    @override
    List<Object> get props => [id,ProductRepository];


}