import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/Network/networl_info.dart';
import 'package:task_6/core/error/exception.dart';
import 'package:task_6/core/error/faliure.dart';
import 'package:task_6/data/dataSource/local_product_source.dart';
import 'package:task_6/data/dataSource/remote_product_source.dart';
import 'package:task_6/data/model/product_model.dart';
import 'package:task_6/data/repository/product_repository_impl.dart';
import 'package:dartz/dartz.dart';

import '../../helper/helper.mocks.dart';


void main() {
  late ProductRepositoryImpl repository;
  late MockProductRemoteDataSource mockRemoteDataSource;
  late MockProductLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockProductRemoteDataSource();
    mockLocalDataSource = MockProductLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ProductRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getProducts', () {
    final tProductModel = ProductsModel(
      id: 1,
      name: 'Test Product',
      description: 'Test Description',
      imageUrl: 'http://example.com/image.jpg',
      price: 99.99,
    );

    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      // act
      repository.getProducts();

      // assert
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test('should return remote data when the call to remote data source is successful', () async {
        // arrange
        when(mockRemoteDataSource.getProductById(any))
            .thenAnswer((_) async => tProductModel);
        when(mockLocalDataSource.cacheProduct(any))
            .thenAnswer((_) async => true);

        // act
        final result = await repository.getProducts();

        // assert
        verify(mockRemoteDataSource.getProductById(12));
        expect(result, equals(Right(tProductModel)));
      });

      test('should cache the data locally when the call to remote data source is successful', () async {
        // arrange
        when(mockRemoteDataSource.getProductById(any))
            .thenAnswer((_) async => tProductModel);

        // act
        await repository.getProducts();

        // assert
        verify(mockRemoteDataSource.getProductById(12));
        verify(mockLocalDataSource.cacheProduct(tProductModel));
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        // arrange
        when(mockRemoteDataSource.getProductById(any))
            .thenThrow(ServerException());

        // act
        final result = await repository.getProducts();

        // assert
        verify(mockRemoteDataSource.getProductById(12));
        expect(result, equals(const Left(ServerFailure('Failed to fetch data from server.'))));
      });
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return locally cached data when the cached data is present', () async {
        // arrange
        when(mockLocalDataSource.getCachedProducts())
            .thenAnswer((_) async => [tProductModel]);

        // act
        final result = await repository.getProducts();

        // assert
        verify(mockLocalDataSource.getCachedProducts());
        expect(result, equals(Right(tProductModel)));
      });

      test('should return CacheFailure when there is no cached data present', () async {
        // arrange
        when(mockLocalDataSource.getCachedProducts())
            .thenThrow(CacheException());

        // act
        final result = await repository.getProducts();

        // assert
        verify(mockLocalDataSource.getCachedProducts());
        expect(result, equals(const Left(CacheFailure('No cached data available.'))));
      });
    });
  });
}


