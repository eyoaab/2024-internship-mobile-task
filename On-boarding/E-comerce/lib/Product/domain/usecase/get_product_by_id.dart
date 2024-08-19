import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/faliure.dart';
import '../entitiy/product_entities.dart';
import '../repository/product_repository.dart';

class ShowProductById extends Equatable {
  final ProductRepository productRepository;

  ShowProductById(this.productRepository);

  Future<Either<Failure, ProductEnities>> call_show(String productId) async {
    return productRepository.getProductById(productId);
  }

  @override
  List<Object?> get props => [productRepository];
}
