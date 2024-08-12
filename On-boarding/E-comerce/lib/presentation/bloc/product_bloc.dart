
 import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/add_product_usecase.dart';
import '../../domain/usecase/delete_product_usecase.dart';
import '../../domain/usecase/get_all_products.dart';
import '../../domain/usecase/get_product_by_id.dart';
import '../../domain/usecase/update_product_usecase.dart';
import './product_event.dart';
import './product_state.dart';


 
class ProductBloc extends Bloc<ProductEvent, ProductState> {
    final AllProductUsecase getAllProductsUseCase;
    final ShowProductById getProductByIdUseCase;
    final UpdateProductUsecase updateProductUseCase;
    final DeleteProductbyidUsecase deleteProductUseCase;
    final AddProducctUsecase addProductUseCase;


  ProductBloc({required this.getAllProductsUseCase
                ,required this.getProductByIdUseCase
                ,required this.updateProductUseCase,
                required this.deleteProductUseCase,
                required this.addProductUseCase}): super(IntialState()) {
      on<LoadAllProductEvent>((event,emit) async{
           try{
              emit(LoadingState());
              final result = await getAllProductsUseCase.call_AllProducts();
              result.fold(
              (error) => emit(ErrorState(message: error.toString())),             
               (products) => emit(LoadedAllProductState(data: products)),
              ); 
              }
            catch(e){
                emit(ErrorState(message:  e.toString()));
              }

      });



    on<GetSingleProductEvent>((event,emit) async{
      try{
        emit(LoadingState());
        final result = await getProductByIdUseCase.call_show(int.parse(event.Id));

             result.fold(
              (error) => emit(ErrorState(message: error.toString())),             
               (product) => emit(LoadedSingleProductState(product: product)),
              );
      }
      catch(e){
        emit(ErrorState(message: e.toString()));
      }

    });// done




    on<UpdateProductEvent>((event,emit) async{
      try{
        emit(LoadingState());
        final result = await updateProductUseCase.call_update(event.product.id,event.product);

             result.fold(
              (error) => emit(ErrorState(message: error.toString())),             
               (product) => emit(UpdatedState())
              );
      }
      catch(e){
        emit(ErrorState(message: e.toString()));
      }
    });// done




    on<DeleteProductEvent>((event,emit)async{

         try{
        emit(LoadingState());
        final result = await deleteProductUseCase.call_delete(int.parse(event.Id));

             result.fold(
              (error) => emit(ErrorState(message: error.toString())),             
               (product) => emit(DeletedState())
              );
      }
      catch(e){
        emit(ErrorState(message: e.toString()));
      }


    });// done

    on<AddProductEvent>((event,emit) async{
      try{
        emit(LoadingState());
        final result = await addProductUseCase.call_add(event.product);

             result.fold(
              (error) => emit(ErrorState(message: error.toString())),             
               (product) => emit(AddState())
              );
      }
      catch(e){
        emit(ErrorState(message: e.toString()));
      }

    });//done
  }



// void _LoadAllProductEvent(LoadAllProductEvent event, Emitter<ProductState> emit) async {
//   final AllProductUsecase getAllProductsUseCase = AllProductUsecase(productRepository: );

//   try{
    
//   emit(LoadingState());
//   final result = await getAllProductsUseCase.call_AllProducts();
//   result.fold(
//     (error) => emit(ErrorState(message: error.toString())),
    
//     (products) => emit(LoadedAllProductState(data: products)),

//   );
  

//   }
//   catch(e){
//     emit(ErrorState(message:  e.toString()));
//   }
// }









// void _GetSingleProductEvent(GetSingleProductEvent event, Emitter<ProductState> emit) {
//   final ShowProductById getProductByIdUseCase;

// }

// void _UpdateProductEvent(UpdateProductEvent event, Emitter<ProductState> emit) {
//   final UpdateProductUsecase updateProductUseCase;
// }

// void _DeleteProductEvent(DeleteProductEvent event, Emitter<ProductState> emit) {
//   final DeleteProductbyidUsecase deleteProductUseCase;

// }

// void _AddProductEvent(AddProductEvent event, Emitter<ProductState> emit) {
//   final AddProducctUsecase addProductUseCase;

// }

}

