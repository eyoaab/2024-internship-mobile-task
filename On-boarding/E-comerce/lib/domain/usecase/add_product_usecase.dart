import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task_6/core/error/faliure.dart';
import 'package:task_6/domain/entitiy/product_entities.dart';
import 'package:task_6/domain/repository/product_repository.dart';



class AddProducctUsecase extends Equatable{

  final ProductEnities product;
  final ProductRepository productRepository;

  const AddProducctUsecase({required this.product,required this.productRepository});


 Future<Either<Failure,ProductEnities>> call_add() async {
    return productRepository.ProductAdd(product);}
  
  @override
  List<Object?> get props => throw UnimplementedError();
}