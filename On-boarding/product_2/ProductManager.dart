import './Product.dart';

class ProductManager {
  List<Product> products = [];

  void addProduct(String name, String description, double price) {
    products.add(Product(name, description, price));
    print('----------------------------------------------');
    print('------Succesfully saved the $name ------------');
    print('----------------------------------------------');

    print('');
  }

  void viewAllProducts() {
    if (products.isEmpty) {
      print('----------------------------------------------');
      print('------------THERE IS NO PRODUCT---------------');
      print('----------------------------------------------');
      return;
    } else {
      print('------------ALL PRODUCTS---------------');
      for (var product in products) {
        print('.........................................');
        print("Name: " + product.name);
        print("Description: " + product.description);
        print("price: " + product.price.toString());
        print('.........................................');
      }
      print('-------------------------------------------');
      print('');
    }
  }

  void viewProduct(int index) {
      print('----------------------------------------------');

    if (index < 0 || index >= products.length) {
      print('----------Product not found.-------------------');
      print('----------------------------------------------');
      
      return;
    }
    var product = products[index];
        print("Name: " + product.name);
        print("Description: " + product.description);
        print("Price: " + product.price.toString());
        print('----------------------------------------------');

  }

  void editProduct(int index, String name, String description, double price) {
    if (index < 0 || index >= products.length) {
      print('----------------------------------------------');
      print('-----PRODUCT NOT FOUND WITH THIS INDEX----------');
      print('----------------------------------------------');
      return;
    }
    products[index].name = name;
    products[index].description = description;
    products[index].price = price;
    print('----------------------------------------------');
    print('-------PRODUCT UPDATED SUCCESSFULY.-----------');
    print('----------------------------------------------');
  }

  void deleteProduct(int index) {
    if (index < 0 || index >= products.length) {
      print('----------------------------------------------');
      print('-----PRODUCT NOT FOUND WITH THIS INDEX--------');
      print('----------------------------------------------');
      return;
    }
    products.removeAt(index);
    print('----------------------------------------------');
    print('-------PRODUCT DELETED SUCCESSFULY.-----------');
    print('----------------------------------------------');
  }
}
