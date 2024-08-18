

 import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/add_product_usecase.dart';
import '../../domain/usecase/delete_product_usecase.dart';
import '../../domain/usecase/get_all_products.dart';
import '../../domain/usecase/get_product_by_id.dart';
import '../../domain/usecase/login_usecase.dart';
import '../../domain/usecase/signIn_usecase.dart';
import '../../domain/usecase/update_product_usecase.dart';
import './product_event.dart';
import './product_state.dart';


 
class ProductBloc extends Bloc<ProductEvent, ProductState> {
    final AllProductUsecase getAllProductsUseCase;
    final ShowProductById getProductByIdUseCase;
    final UpdateProductUsecase updateProductUseCase;
    final DeleteProductbyidUsecase deleteProductUseCase;
    final AddProductUsecase addProductUseCase;
    final LoginUsecase loginUsecase;
    final SignUpUswcase signUpUsecase; 


  ProductBloc( { required this.getAllProductsUseCase,
                 required this.getProductByIdUseCase,
                 required this.updateProductUseCase,
                 required this.deleteProductUseCase,
                 required this.addProductUseCase  ,
                 required this.loginUsecase,
                 required this.signUpUsecase }): super(IntialState()) {
      
      on<LoadAllProductEvent>((event,emit) async{
              emit(LoadingState());
              final result = await getAllProductsUseCase.call_AllProducts();
              
              result.fold(
              (error) => emit(ErrorState(message: error.toString())),               
               (products) => emit(LoadedAllProductState(data: products)),
              ); 
              
      });
;

    on<GetSingleProductEvent>((event,emit) async{
      
        emit(LoadingState());
        final result = await getProductByIdUseCase.call_show(event.Id);

             result.fold(
              (error) => emit(ErrorState(message: error.toString())),             
               (product) => emit(LoadedSingleProductState(product: product)),
              );        
    });

    on<UpdateProductEvent>((event,emit) async{
        emit(LoadingState());
        print('update onrequest bloc');
        final result = await updateProductUseCase.call_update(event.product.id,event.product);
        print('update response on bloc');


             result.fold(
              (error) => emit(ErrorState(message: error.toString())),             
               (product) => emit(UpdatedState(check: product))
              );   
    });

    on<DeleteProductEvent>((event,emit)async{
        emit(LoadingState());
        final result = await deleteProductUseCase.call_delete(event.Id);

             result.fold(
              (error) => emit(ErrorState(message: error.toString())),             
               (product) => emit(DeletedState(check: product))
              );
     });

    on<AddProductEvent>((event,emit) async{
     
        emit(LoadingState());
        final result = await addProductUseCase.call_add(event.product);

             result.fold(
              (error) => emit(ErrorState(message: error.toString())),                         
               (product) => emit(AddState())
              );
      

    });
    
    on<SignInEvent> ((event,emit)async{
      emit(LoadingState());
      final result = await signUpUsecase.call_SignUp(event.userEnities);
      print('result from bloc');
      print(result);

      result.fold(
          (error) => emit(ErrorState(message: error.toString())),
          (token) => emit(LogedState(tokens:'response'))
      );
    });

    on<LogInStateEvent> ((event,emit)async{
      emit(LoadingState());
      final result = await loginUsecase.call_login(event.userEnities);
      print('result from bloc');
      print(result);

      result.fold(
          (error) => emit(ErrorState(message: error.toString())),
          (token) => emit(LogedState(tokens:'response'))
      );
    });
  }
}

