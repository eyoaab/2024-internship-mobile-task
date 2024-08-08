import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_6/core/error/exception.dart';
import 'package:task_6/data/dataSource/local_product_source.dart';
import 'package:task_6/data/model/product_model.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late MockSharedPreferences mockSharedPreferences;
  late ProductLocalDataSourceImpl dataSource;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = ProductLocalDataSourceImpl(store: mockSharedPreferences);
  });

  group('cacheProduct', () {
    const  product = ProductsModel(
      id: 1,
      name: 'Test Product',
      description: 'Product Description',
      imageUrl: 'http://example.com/image.jpg',
      price: 99.99,
    ); // Example product

    test('should cache the product and return true', () async {
      final jsonList = <String>[];
      when(mockSharedPreferences.getStringList('cachedProducts')).thenReturn(jsonList);
      when(mockSharedPreferences.setStringList('cachedProducts',[])).thenAnswer((_) async => true);

      final result = await dataSource.storeProduct(product);

      final expectedJson = jsonEncode(product.toJson());
      verify(mockSharedPreferences.setStringList('cachedProducts', [expectedJson])).called(1);
      expect(result, true);
    });
  });

  group('getCachedProducts', () {
    const product = ProductsModel(
      id: 1,
      name: 'Test Product',
      description: 'Product Description',
      imageUrl: 'http://example.com/image.jpg',
      price: 99.99,
    ); 
    final jsonList = [jsonEncode(product.toJson())];

    test('should return list of products when cached data is available', () async {
      
      when(mockSharedPreferences.getStringList('cachedProducts')).thenReturn(jsonList);

   
      final result = await dataSource.getStoredProducts();

     
      expect(result, [product]);
    });

    test('should throw CacheException when no cached data is available', () async {
     
      when(mockSharedPreferences.getStringList('cachedProducts')).thenReturn(null);


      final call = dataSource.getStoredProducts;

    
      expect(() => call(), throwsA(isA<CacheException>()));
    });
  });
}
