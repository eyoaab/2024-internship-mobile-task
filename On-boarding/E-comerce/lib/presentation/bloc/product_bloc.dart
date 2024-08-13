import 'package:bloc/bloc.dart';
import './product_event.dart';
import './product_state.dart';


class ProductBloc extends Bloc<ProductEvents, ProductState> {
  ProductBloc() : super(InitialState()) {

    on<LoadAllProductEvents>((event, emit) {});
    on<GetSingleProductEvents>((event, emit) {});
    on<UpdateProductEvent>((event, emit) {});
    on<DeleteProductEvent>((event, emit) {});
    on<CreateProductEvent>((event, emit) {});


  }
}
