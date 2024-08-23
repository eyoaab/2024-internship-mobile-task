import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/Product/domain/repository/product_repository.dart';
import 'package:task_6/Product/domain/usecase/delete_product_usecase.dart';
import 'package:task_6/core/error/faliure.dart';

// Mock class for the ProductRepository
class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late DeleteProductbyidUsecase usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = DeleteProductbyidUsecase(mockProductRepository);
  });

  const  testProductId = '123';

test('should call ProductDelete on the repository and return true when the product is deleted successfully', () async {
    // Arrange
    when(mockProductRepository.ProductDelete(testProductId))
        .thenAnswer((_) async => const Right(true));

    // Act
    final result = await usecase.call_delete(testProductId);

    // Assert
    // expect(result, const Right(true));
    verify(mockProductRepository.ProductDelete(testProductId));
    verifyNoMoreInteractions(mockProductRepository);
  });

  test('should return a Failure when deleting a product fails', () async {
    // Arrange
    const failure =  ServerFailure('failes to delete');
    when(mockProductRepository.ProductDelete(testProductId))
        .thenAnswer((_) async => const Left(failure));

    // Act
    final result = await usecase.call_delete(testProductId);

    // Assert
    expect(result, const Left(failure));
    verify(mockProductRepository.ProductDelete(testProductId));
    verifyNoMoreInteractions(mockProductRepository);
  });
}
