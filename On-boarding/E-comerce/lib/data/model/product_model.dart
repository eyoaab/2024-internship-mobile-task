
import '../../domain/entitiy/product_entities.dart';

class ProductsModel extends ProductEnities{

  const ProductsModel({
    required id,
    required name,
    required description,
    required imageUrl,
    required price,
  }):super(id:id, name:name, description:description, imageUrl:imageUrl, price:price);
 
  // model thing is similar with the entities but is used for saving datas and geting datas from the 
  // database 

 
  
  // convert the retrived product model to a map 
  // is usefull when we want to save the data in a database or send it to the client or user
  // because a Map is a simple key-value collection in Dart
  // and it is easy to convert back to Map when we want to save or send data.
  // the key in the map is the name of the property in the model and the value is the property value
  // so we can easily save and retrieve data from the database or send it to the client or user


  Map <String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
    };}


  // i am going to define a factory constructor
  // constructor is used when we want to create a new instance of the model from a Map
  // is useful when we receive data from the server or from a database and want to convert it to a model
  // the key in the map is the name of the property in the model and the value is the property value


  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      price: json['price'],
    );
  }
  
}