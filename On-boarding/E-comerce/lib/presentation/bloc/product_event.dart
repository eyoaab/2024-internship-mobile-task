
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
  int Id;
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
  int Id;
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
=======
abstract class ProductEvents {}

class LoadAllProductEvents extends ProductEvents {
   LoadAllProductEvents();
}

class GetSingleProductEvents extends ProductEvents {
  int productid;
  GetSingleProductEvents(this.productid);
}

class UpdateProductEvent extends ProductEvents {
  int productid;
  ProductEnities product;
  UpdateProductEvent(this.productid, this.product);
}

class DeleteProductEvent extends ProductEvents {
  int productid;
  DeleteProductEvent(this.productid);

}

class CreateProductEvent extends ProductEvents {
  ProductEnities product;
  CreateProductEvent(this.product);
}
