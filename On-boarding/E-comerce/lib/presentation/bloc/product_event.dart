
import 'package:equatable/equatable.dart';

import '../../domain/entitiy/product_entities.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}


class LoadAllProductEvent extends ProductEvent{
  const LoadAllProductEvent();

  @override
  List<Object> get props => [];

}

class GetSingleProductEvent extends ProductEvent{
  String Id;
  GetSingleProductEvent(this.Id);

  @override
  List<Object> get props => [Id];
}

class UpdateProductEvent extends ProductEvent{
 ProductEnities product;
  UpdateProductEvent(this.product);

  @override
  List<Object> get props => [product];
}

class DeleteProductEvent extends ProductEvent{
  String Id;
  DeleteProductEvent(this.Id);

  @override
  List<Object> get props => [Id];
}

class AddProductEvent extends ProductEvent{
  ProductEnities product;
  AddProductEvent(this.product);

  @override
  List<Object> get props => [product];
}
