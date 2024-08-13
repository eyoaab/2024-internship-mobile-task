import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/domain/entitiy/product_entities.dart';
import 'package:task_6/presentation/bloc/product_bloc.dart';
import 'package:task_6/presentation/bloc/product_event.dart';
import 'package:task_6/presentation/bloc/product_state.dart';

import '../../helper/helper.mocks.dart';

void main() {
  late MockAllProductUsecase mockAllProductUsecase;
  late ProductBloc productBloc;

  setUp(() {
    mockAllProductUsecase = MockAllProductUsecase();
    productBloc = ProductBloc(mockAllProductUsecase);
  });

  const tempProduct = ProductEnities(id: 1, name: 's', description: 's', imageUrl: 's', price: 1);
  const tempProduct1 = ProductEnities(id: 1, name: 's', description: 's', imageUrl: 's', price: 1);
  final List<ProductEnities> tempData = [tempProduct, tempProduct1]; 

  test('the initial state should be empty', () {
    expect(productBloc.state, IntialState());
  });

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
}
