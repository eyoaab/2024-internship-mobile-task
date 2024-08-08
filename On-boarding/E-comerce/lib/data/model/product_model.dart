import '../../domain/entitiy/product_entities.dart';

class ProductsModel extends ProductEnities {
  // it extends because it is an ebtity we use ut for exchange a product
  const ProductsModel({
    required int id,
    required String name,
    required String description,
    required String imageUrl,
    required double price,
  }) : super(
          id: id,
          name: name,
          description: description,
          imageUrl: imageUrl,
          price: price,
        );

  // Convert the retrieved product model to a map
  // This is useful when we want to save the data in a database or send it to the client or user
  // because a Map is a simple key-value collection in Dart
  // and it is easy to convert back to Map when we want to save or send data.
  // The key in the map is the name of the property in the model and the value is the property value
  // so we can easily save and retrieve data from the database or send it to the client or user

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
    };
  }

  // Define a factory constructor
  // This constructor is used when we want to create a new instance of the model from a Map
  // This is useful when we receive data from the server or from a database and want to convert it to a model
  // The key in the map is the name of the property in the model and the value is the property value

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      price: json['price'],
    );
  }

  // Method to convert ProductsModel to ProductEntities just if we need
  ProductEnities toEntity() {
    return ProductEnities(
      id: id,
      name: name,
      description: description,
      imageUrl: imageUrl,
      price: price,
    );
  }
}
