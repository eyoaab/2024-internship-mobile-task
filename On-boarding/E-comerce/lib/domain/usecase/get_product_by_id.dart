import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/faliure.dart';
import '../entitiy/product_entities.dart';
import '../repository/product_repository.dart';

class ShowProductById extends Equatable{
  final int id;
  final ProductRepository productRepository;
  const ShowProductById({required this.id,required this.productRepository});

  Future<Either<Failure,ProductEnities>> call_show(int productId){
    return productRepository.getProductById(productId);

  }

  @override
  List<Object> get props => [id,productRepository];

}