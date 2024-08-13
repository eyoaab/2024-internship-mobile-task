// class Urls {
//   static const String baseUrl =
//       'https://g5-flutter-learning-path-be.onrender.com/api/v1/products';
//   static String getProduct(int id) => '$baseUrl/$id';
// }

class Urls {

  static String getByUrl(int id) =>  'https://fakestoreapi.com/products/$id';
  // static String getAll() =>  'https://fakestoreapi.com/products';
  static String getAll() =>  'https://g5-flutter-learning-path-be.onrender.com/api/v1/products';

  static String addNewProduct() => 'https://fakestoreapi.com/products';
  static String updateProduct(int id) => 'https://fakestoreapi.com/products/$id';
  static String deleteProduct(int id) => 'https://fakestoreapi.com/products/$id';
}
