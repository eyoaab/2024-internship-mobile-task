import 'package:equatable/equatable.dart';

import '../../domain/entitiy/product_entities.dart';

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