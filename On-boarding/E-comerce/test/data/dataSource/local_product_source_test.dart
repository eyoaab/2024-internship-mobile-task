import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_6/core/error/exception.dart';
import 'package:task_6/data/dataSource/local_product_source.dart';
import 'package:task_6/data/model/product_model.dart';

import '../../helper/helper.mocks.dart';


@GenerateNiceMocks([MockSpec<SharedPreferences>()])
void main() {
  late ProductLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = ProductLocalDataSourceImpl(store: mockSharedPreferences);
  });

  group('storeProduct', () {
    const tProductModel = ProductsModel(
      id: 'cd',
      name: 'Product 1',
      price: 9.99,
      description: 'efe',
      imageUrl: 'https://example.com/image.jpg',

    );

    test('should store product in SharedPreferences', () async {
      // Arrange
      when(mockSharedPreferences.getStringList(any))
          .thenReturn([]);
      when(mockSharedPreferences.setStringList(any, any))
          .thenAnswer((_) async => true);

      // Act
      final result = await dataSource.storeProduct(tProductModel);

      // Assert
      final expectedJsonString = jsonEncode(tProductModel.toJson());
      verify(mockSharedPreferences.setStringList(
          'savedProducts', [expectedJsonString]));
      expect(result, true);
    });

    test('should return false if storing fails', () async {
      // Arrange
      when(mockSharedPreferences.getStringList(any))
          .thenReturn([]); // Empty list initially
      when(mockSharedPreferences.setStringList(any, any))
          .thenAnswer((_) async => false);

      // Act
      final result = await dataSource.storeProduct(tProductModel);

      // Assert
      expect(result, false);
    });
  });

  group('getStoredProducts', () {
    const tProductModel = ProductsModel(
      id: 'a',
      name: 'Product 1',
      price: 9.99,
      description: 'aa',
      imageUrl: 'aa',
      
    );
    final tProductList = [tProductModel];
    final tJsonList = tProductList.map((product) => jsonEncode(product.toJson())).toList();

    test('should return List<ProductsModel> when there is data in SharedPreferences', () async {
      // Arrange
      when(mockSharedPreferences.getStringList(any))
          .thenReturn(tJsonList);

      // Act
      final result = await dataSource.getStoredProducts();

      // Assert
      expect(result, tProductList);
    });

    test('should throw a CacheException when there is no data in SharedPreferences', () async {
      // Arrange
      when(mockSharedPreferences.getStringList(any))
          .thenReturn(null);

    
      final call = dataSource.getStoredProducts;    
      expect(() => call(), throwsA(isA<CacheException>()));
     
    });
  });
}
