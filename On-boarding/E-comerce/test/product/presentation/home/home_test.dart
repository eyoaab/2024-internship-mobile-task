import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task_6/Product/domain/entitiy/product_entities.dart';
import 'package:task_6/Product/presentation/Pages/home/Home.dart';
import 'package:task_6/Product/presentation/bloc/product_bloc.dart';
import 'package:task_6/Product/presentation/bloc/product_event.dart';
import 'package:task_6/Product/presentation/bloc/product_state.dart';


class MockProductBloc extends MockBloc<ProductEvent, ProductState>
    implements ProductBloc {}

void main() {
  late MockProductBloc mockProductBloc;
  setUp(() {
    mockProductBloc = MockProductBloc();
    HttpOverrides.global = null;
  });

  

  testWidgets('when loading a product it shoild show a loading indicator',
      (WidgetTester tester) async {
    
    when(() => mockProductBloc.state).thenReturn(LoadingState());

   
    await tester.pumpWidget(BlocProvider<ProductBloc>.value(
      value: mockProductBloc,
      child:  MaterialApp(home: Home()),
    ));

 
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(ListTile),findsNothing);
  });

  testWidgets('when loading it should display a list tile ',(WidgetTester tester) async{

      when(()=> mockProductBloc.state).thenReturn(LoadingState());

        await tester.pumpWidget(BlocProvider<ProductBloc>.value(
      value: mockProductBloc,
      child:  MaterialApp(home: Home()),
    ));







  });


  testWidgets('Displays products when ProductLoaded state is active',
      (WidgetTester tester) async {
    
    final testProducts = [
      const ProductEnities(
          id: '1',
          name: 'Sample Product',
          price: 20.0,
          description: 'Sample description',
          imageUrl: 'https://www.example.com')
    ];
    when(() => mockProductBloc.state)
        .thenReturn(LoadedAllProductState(data: testProducts));

   
    await tester.pumpWidget(BlocProvider<ProductBloc>.value(
      value: mockProductBloc,
      child:  MaterialApp(home: Home()),
    ));
    await tester.pumpAndSettle();

 
    expect(find.text('Available Products'), findsOneWidget);
  
  });

  testWidgets('Displays error message when ProductError state is active',
      (WidgetTester tester) async {
    
    when(() => mockProductBloc.state).thenReturn(ErrorState(message: 'error occured'));

   
    await tester.pumpWidget(BlocProvider<ProductBloc>.value(
      value: mockProductBloc,
      child:  MaterialApp(home: Home()),
    ));
    await tester.pumpAndSettle();

 
    expect(find.text('Sample Product'), findsNothing);
  });

    testWidgets('should find a add icon',
      (WidgetTester tester) async {
        final testProducts = [
      const ProductEnities(
          id: '1',
          name: 'Sample Product',
          price: 20.0,
          description: 'Sample description',
          imageUrl: 'https://www.example.com')
    ];
    
    when(() => mockProductBloc.state).thenReturn(LoadedAllProductState(data: testProducts));

   
    await tester.pumpWidget(BlocProvider<ProductBloc>.value(
      value: mockProductBloc,
      child:  MaterialApp(home: Home()),
    ));
    await tester.pumpAndSettle();

 
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}