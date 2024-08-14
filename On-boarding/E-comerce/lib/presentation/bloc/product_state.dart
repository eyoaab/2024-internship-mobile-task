import 'package:equatable/equatable.dart';

import '../../domain/entitiy/product_entities.dart';

abstract class ProductState extends Equatable{
  const ProductState();

  @override
  List<Object> get props => [];
}

class IntialState extends ProductState {}

class LoadingState extends ProductState {}

class LoadedAllProductState extends ProductState{
  List<ProductEnities> data;
   LoadedAllProductState({required this.data});

  @override
  List<Object> get props => [data];
}

class LoadedSingleProductState extends ProductState{
   final ProductEnities product;
   const LoadedSingleProductState({required this.product});
   @override
   List<Object> get props => [product];
}

class ErrorState extends ProductState{
    final String message;
  const ErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

class UpdatedState extends ProductState{}
class DeletedState extends ProductState{
  final check;
  const DeletedState({required this.check});
  @override
  List<Object> get props => [check];
}
class AddState extends ProductState{}

