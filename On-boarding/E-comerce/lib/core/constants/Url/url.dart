
class Urls {
  String  baseUrl = 'https://g5-flutter-learning-path-be.onrender.com/api/v1/products' ; 

  static String getByUrl(String id) =>  'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id';
  // static String getAll() =>  'https://g5-flutter-learning-path-be.onrender.com/api/v1/products';
  static String getAll() =>  'https://cors-anywhere.herokuapp.com/https://g5-flutter-learning-path-be.onrender.com/api/v1/products';

  static String addNewProduct() => 'https://g5-flutter-learning-path-be.onrender.com/api/v1/products';
  static String updateProduct(String id) => 'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id';
  // static String deleteProduct(String id) => 'https://g5-flutter-learning-path-be.onrender.com/api/v1/products//$id';
  static String deleteProduct(String id) => 'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id';

}
