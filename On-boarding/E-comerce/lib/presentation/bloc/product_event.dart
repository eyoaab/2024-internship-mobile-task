
import '../../domain/entitiy/product_entities.dart';

class ProductEvent {}

class LoadAllProductEvent extends ProductEvent{
  List<ProductEnities> products;
  LoadAllProductEvent(this.products);
}

class GetSingleProductEvent extends ProductEvent{
  String productId;
  ProductEnities product;
  GetSingleProductEvent(this.productId, this.product);

}

class UpdateProductEvent extends ProductEvent{
  String productId;
  ProductEnities product;
  UpdateProductEvent(this.productId, this.product);

}

class DeleteProductEvent extends ProductEvent{
  String productId;
  DeleteProductEvent(this.productId);
}

class AddProductEvent extends ProductEvent{
  ProductEnities product;
  AddProductEvent(this.product);
}
