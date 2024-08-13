
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
class DeletedState extends ProductState{}
class AddState extends ProductState{}



import '../../domain/entitiy/product_entities.dart';

class ProductState {}

final class InitialState extends ProductState {}

final class LoadingState extends ProductState {}

final class ProductErrorState extends ProductState {
  final String errorMessage;
  ProductErrorState({required this.errorMessage});
}


class AllProductLoadedState extends ProductState{
List<ProductEnities> products;
 AllProductLoadedState({required this.products});
}

class SigleProductLoadedState extends ProductState{
  ProductEnities product;
  SigleProductLoadedState({required this.product});
}
