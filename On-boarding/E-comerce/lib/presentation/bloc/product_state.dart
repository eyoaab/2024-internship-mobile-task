import '../../domain/entitiy/product_entities.dart';

class ProductState {
   final List<dynamic> data;
  const ProductState([this.data = const <dynamic>[]]);
}

class IntialState extends ProductState {}

class LoadingState extends ProductState {}

class LoadedAllProductState extends ProductState{
   final List<ProductEnities> data;
  const LoadedAllProductState({required this.data}) : super(data);
}

class LoadedSingleProductState extends ProductState{
   final ProductEnities product;
   const LoadedSingleProductState({required this.product});
}

class ErrorState extends ProductState{
    final String message;
  ErrorState({required this.message}) : super([message]);
}
