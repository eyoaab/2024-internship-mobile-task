// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:task_6/Product/data/model/ptoduct_to_save.dart';
// import 'package:task_6/Product/domain/usecase/add_product_usecase.dart';
// import '../../helper/helper.mocks.dart';

// // Mock class for the ProductRepository
// class MockProductRepository extends Mock implements ProductRepository {}

// void main() {
//   late AddProductUsecase usecase;
//   late MockProductRepository mockProductRepository;

//   setUp(() {
//     mockProductRepository = MockProductRepository();
//     usecase = AddProductUsecase(mockProductRepository);
//   });

//   final testProduct = SendProduct( name: 'Test Product', description: 'Test Description', price: 10.0, imageUrl: 'http://test.com/image.jpg');

//   test('should call ProductAdd on the repository and return true when the product is added successfully', () async {
//     // Arrange
//     when(mockProductRepository.ProductAdd(testProduct))
//         .thenAnswer((_) async => Right(true));

//     // Act
//     final result = await usecase.call_add(testProduct);

//     // Assert
//     expect(result, Right(true));
//     verify(mockProductRepository.ProductAdd(testProduct));
//     verifyNoMoreInteractions(mockProductRepository);
//   });

//   test('should return a Failure when adding a product fails', () async {
//     // Arrange
//     final failure = ServerFailure();
//     when(mockProductRepository.ProductAdd(testProduct))
//         .thenAnswer((_) async => Left(failure));

//     // Act
//     final result = await usecase.call_add(testProduct);

//     // Assert
//     expect(result, Left(failure));
//     verify(mockProductRepository.ProductAdd(testProduct));
//     verifyNoMoreInteractions(mockProductRepository);
//   });
// }
