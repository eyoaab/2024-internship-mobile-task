
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/Product/domain/entitiy/product_entities.dart';
import 'package:task_6/Product/presentation/bloc/product_bloc.dart';
import 'package:task_6/Product/presentation/bloc/product_event.dart';
import 'package:task_6/Product/presentation/bloc/product_state.dart';
import 'package:task_6/core/error/faliure.dart';

import '../../../helper/helper.mocks.dart';

void main() {
  late  MockShowProductById mockShowProductById;
  late MockAllProductUsecase mockAllProductUsecase;
  late MockDeleteProductbyidUsecase mockDeleteProductbyidUsecase;
  late MockUpdateProductUsecase updateProductUseCase;
  late MockAddProductUsecase mockAddProductUsecase;
  late ProductBloc productBloc;

  setUp(() {
    mockShowProductById = MockShowProductById();
    mockAllProductUsecase = MockAllProductUsecase();
    mockDeleteProductbyidUsecase = MockDeleteProductbyidUsecase();
    updateProductUseCase = MockUpdateProductUsecase();
    mockAddProductUsecase = MockAddProductUsecase();


    productBloc =  ProductBloc(
      getAllProductsUseCase: mockAllProductUsecase, 
      getProductByIdUseCase: mockShowProductById
      ,updateProductUseCase: updateProductUseCase, 
      deleteProductUseCase: mockDeleteProductbyidUsecase, 
      addProductUseCase: mockAddProductUsecase
    );

     
  });

  const testProduct = ProductEnities(
      id: '6672752cbd218790438efdb0',
      name: 'Anime website',
      description: 'Explore anime characters.',
      price: 123,
      imageUrl:'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg');

  const testId = '6672752cbd218790438efdb0';
  

  test('initial state should be empty', () {
    expect(productBloc.state, IntialState());
  });


  blocTest<ProductBloc, ProductState>(
      'should emit [ProductLoading, GetProducts] when data is gotten successfully',
      build: () {
        when(mockShowProductById.call_show(testId))
            .thenAnswer((_) async =>  Right(testProduct));
        return productBloc;
      },
      act: (bloc) => bloc.add(GetSingleProductEvent(testId)),
      expect: () =>
          [LoadingState(),  const LoadedSingleProductState(product: testProduct)]);
  blocTest<ProductBloc, ProductState>(
      'should emit [ProductLoading, GetAllProducts] when data is gotten successfully',
      build: () {
        when(mockAllProductUsecase.call_AllProducts())
            .thenAnswer((_) async => const Right([]));
        return productBloc;
      },
      act: (bloc) => bloc.add(const LoadAllProductEvent()),
      expect: () =>
          [LoadingState(),  LoadedAllProductState(data:const [])]);

  blocTest<ProductBloc, ProductState>(
      'should emit [ProductLoading, GetAllProducts] when data is gotten successfully',
      build: () {
        when(mockAllProductUsecase.call_AllProducts())
            .thenAnswer((_) async => const Right([]));
        return productBloc;
      },
      act: (bloc) => bloc.add(const LoadAllProductEvent()),
      expect: () =>
          [LoadingState(),  LoadedAllProductState(data: [])]);

  blocTest<ProductBloc, ProductState>(
      'should emit [ProductLoading] when Delete successful',
      build: () {
        when(mockDeleteProductbyidUsecase.call_delete(testId))
            .thenAnswer((_) async => const Right(true));
        return productBloc;
      },
      act: (bloc) => bloc.add(DeleteProductEvent(testId)),
      expect: () => [LoadingState(),const DeletedState(check: true)]);

  blocTest<ProductBloc, ProductState>(
      'should emit [ProductLoading] when Update successful',
      build: () {
        when(updateProductUseCase.call_update(testId, testProduct))
            .thenAnswer((_) async => const Right(true));
        return productBloc;
      },
      act: (bloc) =>
          bloc.add(UpdateProductEvent(testProduct)),
      expect: () => [LoadingState(),const UpdatedState(check: true)]);


  blocTest<ProductBloc, ProductState>(
      'should emit [ProductLoading, ProductLoadFailure] when get data is unsuccessful',
      build: () {
        when(mockShowProductById.call_show(testId)).thenAnswer(
            (_) async => const Left(ServerFailure('Server failure')));
        return productBloc;
      },
      act: (bloc) => bloc.add(GetSingleProductEvent(testId)),
      expect: () => [
            LoadingState(),
            const ErrorState(message: 'Failure: Server failure'),
          ]);



blocTest<ProductBloc,ProductState>(
  'should emit[loading state]-> [Deleted State]',

  build:(){
    when(mockDeleteProductbyidUsecase.call_delete(testId)).thenAnswer((_)async => const Right(false));

    return productBloc;
  },
  act:(bloc)=> bloc.add(DeleteProductEvent(testId)),
  expect: ()=>[LoadingState(),const DeletedState(check: false)]
);
}
