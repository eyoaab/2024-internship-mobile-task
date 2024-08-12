
 import 'package:flutter_bloc/flutter_bloc.dart';
 import './product_event.dart';
 import './product_state.dart';

 import '../../domain/usecase/add_product_usecase.dart';
 import '../../domain/usecase/delete_product_usecase.dart';
 import '../../domain/usecase/get_all_products.dart';
 import '../../domain/usecase/get_product_by_id.dart';
 import '../../domain/usecase/update_product_usecase.dart';




class ProductBloc extends Bloc<ProductEvent, ProductState> {
  


  ProductBloc() : super(IntialState()) {
    on<LoadAllProductEvent>(_LoadAllProductEvent);//doen

    on<GetSingleProductEvent>(_GetSingleProductEvent);// done

    on<UpdateProductEvent>(_UpdateProductEvent);// done

    on<DeleteProductEvent>(_DeleteProductEvent);// done

    on<AddProductEvent>(_AddProductEvent);//done
  }



void _LoadAllProductEvent(LoadAllProductEvent event, Emitter<ProductState> emit) {
  final AllProductUsecase getAllProductsUseCase;
}

void _GetSingleProductEvent(GetSingleProductEvent event, Emitter<ProductState> emit) {
  final ShowProductById getProductByIdUseCase;

}

void _UpdateProductEvent(UpdateProductEvent event, Emitter<ProductState> emit) {
  final UpdateProductUsecase updateProductUseCase;
}

void _DeleteProductEvent(DeleteProductEvent event, Emitter<ProductState> emit) {
  final DeleteProductbyidUsecase deleteProductUseCase;

}

void _AddProductEvent(AddProductEvent event, Emitter<ProductState> emit) {
  final AddProducctUsecase addProductUseCase;

}

}

