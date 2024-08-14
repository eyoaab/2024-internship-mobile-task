import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task_6/core/error/faliure.dart';
import 'package:task_6/domain/repository/product_repository.dart';

class DeleteProductbyidUsecase extends Equatable {
  final ProductRepository productRepository;

  DeleteProductbyidUsecase(this.productRepository);

  Future<Either<Failure, bool>> call_delete(String productId) {
    return productRepository.ProductDelete(productId);
  }

  @override
  List<Object> get props => [productRepository];
}
