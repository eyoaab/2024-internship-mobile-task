import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/error/exception.dart';
import 'package:task_6/core/error/faliure.dart';
import 'package:dartz/dartz.dart';
import 'package:task_6/data/model/product_model.dart';
import 'package:task_6/data/repository/product_repository_impl.dart';

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

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test("should be offline ", (){
        expect(mockNetworkInfo.isConnected, false);

      });
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test("should be online", () {
      expect(mockNetworkInfo.isConnected,false);

      }
      );

    });
  }

  group('getProducts', () {
    const tProductModel = ProductsModel(
      id: 1,
      name: 'Test Product',
      description: 'Test Description',
      imageUrl: 'https://example.com/image.jpg',
      price: 10.0,
    );

    runTestsOnline(() {
      test('should return remote data when the call to remote data source is successful', () async {
        // arrange
        when(mockRemoteDataSource.getProductById(any))
            .thenAnswer((_) async => tProductModel);
        // act
        final result = await repository.getProductById(1);
        // assert
        verify(mockRemoteDataSource.getProductById(any));
        expect(result, equals(Right(tProductModel)));
      });

      test('should cache the data locally when the call to remote data source is successful', () async {
        // arrange
        when(mockRemoteDataSource.getProductById(any))
            .thenAnswer((_) async => tProductModel);
        // act
        await repository.getAllProducts();
        // assert
        verify(mockRemoteDataSource.getProductById(any));
        verify(mockLocalDataSource.cacheProduct(tProductModel));
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        // arrange
        when(mockRemoteDataSource.getProductById(any))
            .thenThrow(ServerException());
        // act
        final result = await repository.getAllProducts();
        // assert
        verify(mockRemoteDataSource.getProductById(any));
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(const Left(ServerFailure('Failed to fetch data from server.'))));
      });
    });

    runTestsOffline(() {
      test('should return last locally cached data when the cached data is present', () async {
        // arrange
        when(mockLocalDataSource.getCachedProducts())
            .thenAnswer((_) async => [tProductModel]);
        // act
        final result = await repository.getAllProducts();
        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getCachedProducts());
        expect(result, equals(Right(tProductModel)));
      });

      test('should return CacheFailure when there is no cached data present', () async {
        // arrange
        when(mockLocalDataSource.getCachedProducts()).thenThrow(CacheException());
        // act
        final result = await repository.getAllProducts();
        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getCachedProducts());
        expect(result, equals(const Left(CacheFailure('No cached data available.'))));
      });
    });
  });
}


