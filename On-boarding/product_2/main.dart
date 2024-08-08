import 'dart:io';
import 'ProductManager.dart';

void main() {
  ProductManager productManager = ProductManager();

  while (true) {
    print('1. Add Product');
    print('2. View All Products');
    print('3. View Product');
    print('4. Edit Product');
    print('5. Delete Product');
    print('6. Exit');
    print('----------------------------------------------');
    print('-------------CHOOSE AN OPTION-----------------');
    print('------------------------------------------------');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter product name: ');
        String name = stdin.readLineSync()!;

        stdout.write('Enter product description: ');
        String description = stdin.readLineSync()!;

        stdout.write('Enter product price: ');
        String price_input = (stdin.readLineSync()!);

        double? price = double.tryParse(price_input);
        if (price != null) {
          productManager.addProduct(name, description, price);
        } else {
          print('----------------------------------------------');
          print('------PLEASE ENTER A VALID TYPE OF DATA---------');
          print('------------------------------------------------');
        }

        break;

      case '2':
        productManager.viewAllProducts();
        break;

      case '3':
        stdout.write('Enter product index: ');
        String inputIndex = (stdin.readLineSync()!);
        int? index = int.tryParse(inputIndex);
        if (index != null) {
          productManager.viewProduct(index);
        } else {
          print('------PLEASE ENTER A VALID INDEX NUMBER---------');
        }

        break;

      case '4':
        stdout.write('Enter product index: ');
        String inputIndex = (stdin.readLineSync()!);
        int? index = int.tryParse(inputIndex);
        if (index != null) {
          productManager.viewProduct(index);
          stdout.write('Enter new product name: ');
          String newName = stdin.readLineSync()!;
          stdout.write('Enter new product description: ');
          String newDescription = stdin.readLineSync()!;
          stdout.write('Enter new product price: ');
          double newPrice = double.parse(stdin.readLineSync()!);
          productManager.editProduct(index, newName, newDescription, newPrice);
        } else {
          print('------PLEASE ENTER A VALID INDEX NUMBER---------');
        }
        break;

      case '5':
        stdout.write('Enter product index: ');
        String inputIndex = (stdin.readLineSync()!);
        int? index = int.tryParse(inputIndex);
        if (index != null) {
          productManager.deleteProduct(index);
        }
        else{
          print('------PLEASE ENTER A VALID INDEX NUMBER---------');

        }
        break;
      case '6':
        print('----------------------------------------------');
        print('--------EXITING FROM THE APPLICATION----------');
        print('------------------------------------------------');
        return;
      default:
        print('----------------------------------------------');
        print('--------INVALID OPTION PLEASE TRY AGAIN--------');
        print('------------------------------------------------');
    }
  }
}
