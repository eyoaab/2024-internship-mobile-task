import 'package:flutter_test/flutter_test.dart';
import 'package:task_6/domain/entitiy/product_entities.dart';

void main() {
  const testEntity1 = ProductEnities(
    id: 1,
    name: 'Product 1',
    description: 'Description of Product 1',
    imageUrl: 'https://example.com/product1.jpg',
    price: 29.99,
  );

  const testEntity2 = ProductEnities(
    id: 1,
    name: 'Product 1',
    description: 'Description of Product 1',
    imageUrl: 'https://example.com/product1.jpg',
    price: 29.99,
  );

  group('ProductEntities', () {
    test('should assign the values properly', () {
      expect(testEntity1.name, 'Product 1');
      expect(testEntity1.description, 'Description of Product 1');
      expect(testEntity1.imageUrl, 'https://example.com/product1.jpg');
      expect(testEntity1.price, 29.99);
    });

    test('should compare equality based on properties', () {
      expect(testEntity1, testEntity2);
    });

    
  });
}
