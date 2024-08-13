import 'dart:ffi';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/domain/entitiy/product_entities.dart';
import 'package:task_6/presentation/bloc/product_bloc.dart';
import 'package:task_6/presentation/bloc/product_event.dart';
import 'package:task_6/presentation/bloc/product_state.dart';

import '../../helper/helper.mocks.dart';

void main() {

  late MockAllProductUsecase mockAllProductUsecase;
  late MockShowProductById mockShowProductById;
  late MockUpdateProductUsecase mockUpdateProductUsecase;
  late MockDeleteProductbyidUsecase mockDeleteProductbyidUsecase;
  late MockAddProducctUsecase mockAddProducctUsecase;
  late ProductBloc productBloc;


  setUp(() {
    mockAllProductUsecase = MockAllProductUsecase();
    mockShowProductById = MockShowProductById();
    mockUpdateProductUsecase = MockUpdateProductUsecase();
    mockDeleteProductbyidUsecase = MockDeleteProductbyidUsecase();
    mockAddProducctUsecase = MockAddProducctUsecase();
    productBloc = ProductBloc(mockAllProductUsecase,mockShowProductById,mockUpdateProductUsecase,mockDeleteProductbyidUsecase,mockAddProducctUsecase);
  });

  const tempId = 1;
  const tempProduct = ProductEnities(id: 1, name: 's', description: 's', imageUrl: 's', price: 1);
  const tempProduct1 = ProductEnities(id: 1, name: 's', description: 's', imageUrl: 's', price: 1);
  final List<ProductEnities> tempData = [tempProduct, tempProduct1]; 

  test('the initial state should be empty', () {
    expect(productBloc.state, IntialState());
  });
// to test show all product bloc

  blocTest<ProductBloc, ProductState>(
    'should emit [LoadingState] and LoadedAllProductState]',
    build: () {
      when(mockAllProductUsecase.call_AllProducts()).thenAnswer((_) async => Right(tempData));
      return productBloc;
    },
    act: (bloc) => bloc.add(const LoadAllProductEvent()),
    expect: () => [
      LoadingState(),
       LoadedAllProductState(data: tempData),
    ],
  );

  

 /// test for get product by id 
 

 blocTest('should return [loading] and [product] states',
  build: (){
    when(mockShowProductById.call_show(tempId)).thenAnswer((_) async => const Right(tempProduct));
    return productBloc;
  },
  act: (bloc) => bloc.add(GetSingleProductEvent(tempId)),
  expect: () => [
    LoadingState(),
   const LoadedSingleProductState(product: tempProduct1),
  ],
  
  );
  

// test for updating the products


blocTest('[loading state] -> [updated state]', build: (){
  when(mockUpdateProductUsecase.call_update(tempProduct.id,tempProduct)).thenAnswer((_) async => const Right(true));
  return productBloc;

},
  act: (bloc) => bloc.add(UpdateProductEvent(tempProduct)),
  expect: () => [
    LoadingState(),
    UpdatedState(),
  ],
);

// test for deleting a product


blocTest('[loading state] -> [deleted state]', build: (){
  when(mockDeleteProductbyidUsecase.call_delete(tempId)).thenAnswer((_) async => const Right(true));
  return productBloc;

},
  act: (bloc) => bloc.add(DeleteProductEvent(tempId)),
  expect: () => [
    LoadingState(),
    DeletedState(),
  ],
);


// test for adding a pproduct
blocTest('[loading state],- > [added state]', build: (){
  when(mockAddProducctUsecase.call_add(tempProduct1)).thenAnswer((_) async => const Right(true));
  return productBloc;
},
    act: (bloc) => bloc.add(AddProductEvent(tempProduct1)),
    expect: () => [
    LoadingState(),
    AddState(),
  ],
);
}
