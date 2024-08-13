import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task_6/core/error/faliure.dart';
import 'package:task_6/domain/entitiy/product_entities.dart';
import 'package:task_6/domain/repository/product_repository.dart';

class UpdateProductUsecase extends Equatable {
  final ProductRepository productRepository;

  // Constructor only takes ProductRepository
  UpdateProductUsecase(this.productRepository);

  Future<Either<Failure, bool>> call_update(int productId, ProductEnities product) async {
    return productRepository.ProductUpdate(productId, product);
  }

  @override
  List<Object?> get props => [productRepository];
}
