import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/faliure.dart';
import '../entitiy/product_entities.dart';
import '../repository/product_repository.dart';

class UpdateProductUsecase extends Equatable {
  final ProductRepository productRepository;

  UpdateProductUsecase(this.productRepository);

  Future<Either<Failure, bool>> call_update(String productId, ProductEnities product) async {
        print('update onrequest usecase');

    return productRepository.ProductUpdate(productId, product);
  }

  @override
  List<Object?> get props => [productRepository];
}
