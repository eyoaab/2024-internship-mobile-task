import 'package:flutter_test/flutter_test.dart';
import 'package:task_6/data/model/product_model.dart';

void main() {
  const testModel = ProductsModel(
    id: 'a',
    name: 'Product 1',
    description: 'Description of Product 1',
    imageUrl: 'https://example.com/product1.jpg',
    price: 29.99,
  );

  const testJson = {
    'id': 'a',
    'name': 'Product 1',
    'description': 'Description of Product 1',
    'imageUrl': 'https://example.com/product1.jpg',
    'price': 29.99,
  };

  group('ProductsModel test', () {
    test('should assign the values properly', () {
      expect(testModel.id, 'a');
      expect(testModel.name, 'Product 1');
      expect(testModel.description, 'Description of Product 1');
      expect(testModel.imageUrl, 'https://example.com/product1.jpg');
      expect(testModel.price, 29.99);
    });

    test('should convert to JSON properly', () {
      final json = testModel.toJson();
      expect(json, testJson);
    });

    test('should convert from JSON properly', () {
      final model = ProductsModel.fromJson(testJson);
      expect(model.id, testModel.id);
      expect(model.name, testModel.name);
      expect(model.description, testModel.description);
      expect(model.imageUrl, testModel.imageUrl);
      expect(model.price, testModel.price);
    });
  });
}
