
import 'dart:io';
import 'classControling.dart';

void menu (){
  print('''please select a number:
      1-Add product
      2-Show product
      3-Remove product
      4-Edit product
      5-Less then 5 
      6-Exit''');
}

void main () {
  ProductControl productControl = ProductControl();

  while (true) {
    menu();
    String? input = stdin.readLineSync();
    int? userInput = int.tryParse(input!);
    switch (userInput) {
      case 1:
        productControl.addProduct();
        break;
      case 2:
        productControl.showProduct();
        break;
      case 3:
        productControl.removeProduct();
        break;
      case 4:
        productControl.editProduct();
        break;
      case 5:
        productControl.lessThan5();
        break;
      case 6:
        print('GoodBye');
        return;
      default:
        print("try again");
    }
  }
}































