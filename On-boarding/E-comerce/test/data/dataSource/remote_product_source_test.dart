import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/constants/Url/url.dart';
import 'package:task_6/core/error/exception.dart';
import 'package:task_6/data/dataSource/remote_product_source.dart';
import 'package:task_6/data/model/product_model.dart';


import 'remote_product_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late ProductRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = ProductRemoteDataSourceImpl(mockHttpClient);
  });

  group('getProductById', () {
    const tId = '1';
    const  tProductModel = ProductsModel(
      id: tId,
      name: 'Test Product',
      description: 'Test Description',
      imageUrl: 'http://example.com/image.jpg',
      price: 99.99,
    );
   
    test('should perform a GET request on a URL with the id being the endpoint', () async {
      // arrange
      when(mockHttpClient.get(any))
          .thenAnswer((_) async => http.Response(json.encode(tProductModel.toJson()), 200));

      // act
      await dataSource.getProductById(tId);

      // assert
      verify(mockHttpClient.get(Uri.parse(Urls.getByUrl(tId))));
    });

    test('should return ProductsModel when the response code is 200 (success)', () async {
      // arrange
      when(mockHttpClient.get(any))
          .thenAnswer((_) async => http.Response(json.encode(tProductModel.toJson()), 200));

      final result = await dataSource.getProductById(tId);

      // assert
      expect(result, equals(tProductModel));
    });

    test('should throw a ServerException when the response code is not 200', () async {
       
      when(mockHttpClient.get(any)).thenAnswer((_)async => http.Response('try this',404));     // act
      final result = dataSource.getProductById(tId);

      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  
  });
}
