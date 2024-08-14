import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/faliure.dart';
import '../entitiy/product_entities.dart';
import '../repository/product_repository.dart';

class AddProductUsecase extends Equatable {
  final ProductRepository productRepository;

  AddProductUsecase(this.productRepository);

  Future<Either<Failure, bool>> call_add(ProductEnities product) async {
    return productRepository.ProductAdd(product);
  }

  @override
  List<Object?> get props => [productRepository];
}
