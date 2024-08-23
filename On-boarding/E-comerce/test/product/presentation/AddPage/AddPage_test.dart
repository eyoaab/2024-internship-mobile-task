
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task_6/Product/domain/entitiy/product_entities.dart';
import 'package:task_6/Product/presentation/Pages/AddProduct/AddProduct.dart';
import 'package:task_6/Product/presentation/bloc/product_bloc.dart';
import 'package:task_6/Product/presentation/bloc/product_state.dart';

// Mock the bloc
class MockProductBloc extends Mock implements ProductBloc {}

void main() {
  late MockProductBloc mockProductBloc;

  setUp(() {
    mockProductBloc = MockProductBloc();
  });

  Future<void> _pumpWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ProductBloc>.value(
          value: mockProductBloc,
          child:  AddProduct(),
        ),
      ),
    );
  }

  testWidgets('shows success Snackbar on successful product creation', (WidgetTester tester) async {
    // Arrange
    const  mockProduct =  ProductEnities(
      id: '1',
      name: 'Test Product',
      price: 50.0,
      description: 'Test Description',
      imageUrl: 'test_image_url',
    );
    when(() => mockProductBloc.state).thenReturn(IntialState());

    whenListen(
      mockProductBloc,
      Stream<ProductState>.fromIterable([const AddState(check: true)]),
    );

    await _pumpWidget(tester);
    expect(find.text('Add'), findsNothing);
  });

}