
import '../../domain/entitiy/product_entities.dart';

class ProductEvent {}

class LoadAllProductEvent extends ProductEvent{
}

class GetSingleProductEvent extends ProductEvent{
  String Id;
  GetSingleProductEvent(this.Id);
}

class UpdateProductEvent extends ProductEvent{
 ProductEnities product;
  UpdateProductEvent(this.product);
}

class DeleteProductEvent extends ProductEvent{
  String Id;
  DeleteProductEvent(this.Id);
}

class AddProductEvent extends ProductEvent{
  ProductEnities product;
  AddProductEvent(this.product);
}
