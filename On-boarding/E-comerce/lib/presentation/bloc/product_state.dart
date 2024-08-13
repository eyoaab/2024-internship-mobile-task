
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