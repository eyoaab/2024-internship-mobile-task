
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
    on<LoadAllProductEvent>((event, emit) {});

    on<GetSingleProductEvent>((event, emit) {});

    on<UpdateProductEvent>((event, emit) {});

    on<DeleteProductEvent>((event, emit) {});

    on<AddProductEvent>((event, emit) {});
  }
}

