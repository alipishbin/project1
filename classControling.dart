import 'classProduct.dart';
import 'dart:io';

import 'tamrin_modiriat_mahsool.dart';

class ProductControl {
  List <Product> myProducts = [];

  void addProduct () {
    print(('please enter the name or press 0 to exit'));
    String? inputOne = stdin.readLineSync();

    String? name = inputOne;
    if (name == "0") {
      return;
    }
    print(('please enter the price or press 0 to exit'));
    String? inputOneTwo = stdin.readLineSync();
    int? price = int.tryParse(inputOneTwo!);
    if (price == 0) {
      return;
    }
    if (price == null){
      print('invalid');
      return addProduct();
    }
    print(('please enter the quantity or press 0 to exit'));
    String? inputOneThree = stdin.readLineSync();
    int? quantity = int.tryParse(inputOneThree!);
    if (quantity == 0) {
      return;
    }
    if (quantity == null){
      print('invalid');
      return addProduct();
    }

    Product newProducts = Product(name, price, quantity);
    myProducts.add(newProducts);
    print('The $name has been successfully added');
  }
  void showProduct (){
    for (int i=0 ; i< myProducts.length ; i++){
      Product products = myProducts[i];
      print('${i+1}- ${products.name} price: ${products.price} quantity: ${products.quantity} ');
    }
  }
  void removeProduct (){
    showProduct();
    print((' enter the number to remove or press 0 to exit'));
    String? input = stdin.readLineSync();
    int? userInput= int.tryParse(input!);
    if (userInput == 0) {
      return;
    } else if(userInput == null || userInput > myProducts.length) {
      print('invalid');
      return removeProduct();
    } else {
      Product remove = myProducts.removeAt(userInput-1);
      print('item ${remove.name} has been successfully removed');
    }
  }
  void editProduct () {
    showProduct();
    print('enter number of product to edit or press 0 to exit');
    String? input = stdin.readLineSync();
    int? userInput = int.tryParse(input!);
    if (userInput == 0) {
      return;
    }
    if (userInput! <= myProducts.length) {

      Product newProduct = myProducts[userInput - 1];
      print('enter new name');
      String? inputOne = stdin.readLineSync();
      if (inputOne == "0") {
        return;
      } else {
        String newName = inputOne!;
        newProduct.name = newName;
      }

      print('enter new price');
      String? inputTwo = stdin.readLineSync();
      int? userInputTwo = int.tryParse(inputTwo!);
      if (userInputTwo == 0) {
        return;
      } else {
        int newPrice = userInputTwo!;
        newProduct.price = newPrice;
      }

      print('enter new quantity');
      String? inputThree = stdin.readLineSync();
      int? userInputThree = int.tryParse(inputThree!);
      if (userInputThree == 0) {
        return;
      } else {
        int newQuantity = userInputThree!;
        newProduct.quantity = newQuantity;
      }

      print('product ${newProduct.name} has been successfully edited.');
    }else if (userInput == null){
      print('invalid');
    }
    else {
      return editProduct();
    }
  }
  void lessThan5 (){
    List<Product> lessFiveList = myProducts.where((element) => element.quantity! < 5).toList();
    for (int i=0 ; i< lessFiveList.length ; i++){
      Product lessFiveProduct = lessFiveList[i];
      print('${i+1}- ${lessFiveProduct.name} price: ${lessFiveProduct.price} quantity: ${lessFiveProduct.quantity} ');
    }
  }
}
