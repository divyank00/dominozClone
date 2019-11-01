import 'dart:ffi';
import 'dart:math';

import 'package:pizza_delivery/code/pizza.dart';

class Customise {
  static List<String> sizes = <String>['Small', 'Medium', 'Large'];

  static List<String> crusts = <String>['New Hand Tossed', 'Wheat Thin Crust', 'Cheese Burst','Fresh Pan Pizza','Classic Hand Tossed'];

  static List<String> toppings = <String>['Onion', 'Fresh Tomato','Grilled Mushrooms', 'Paneer', 'Jalapeno','Red Paprika', 'Golden Corn','Crisp Capsicum','Black Olive','Paneer Tikka'];
  static List<String> toppingsPath=<String> ['images/toppingsOnion.jpg','images/toppingsTomato.jpg','images/toppingsMushroom.jpg','images/toppingsPaneer.jpg','images/toppingsJalapeno.jpg','images/toppingsPaparika.jpg','images/toppingsGoldenCorn.jpg','images/toppingsCapsicum.jpg','images/toppingsOlives.jpg','images/paneerTikka.jpg'];
  String def_size = sizes.elementAt(1);

  String def_crust=crusts.elementAt(0);


  String path,name, desc;

  int price;

  bool cheese;

  Map<String, bool> crust = new Map<String, bool>();

  Map<String, bool> topping = new Map<String, bool>();

  Customise(Pizza pizza) {
    path=pizza.path;
    name=pizza.name;
    desc=pizza.desc;
    price = pizza.price;

    cheese=false;

    crust.putIfAbsent('New Hand Tossed', ()=>false);
    crust.putIfAbsent('Wheat Thin Crust', ()=>false);
    crust.putIfAbsent('Cheese Burst', ()=>false);
    crust.putIfAbsent('Fresh Pan Pizza', ()=>false);
    crust.putIfAbsent('Classic Hand Tossed', ()=>false);

    topping.putIfAbsent("Grilled Mushrooms", () => false);
    topping.putIfAbsent("Onion", () => false);
    topping.putIfAbsent("Crisp Capsicum", () => false);
    topping.putIfAbsent("Fresh Tomato", () => false);
    topping.putIfAbsent("Paneer", () => false);
    topping.putIfAbsent("Jalapeno", () => false);
    topping.putIfAbsent("Golden Corn", () => false);
    topping.putIfAbsent("Red Paprika", () => false);
    topping.putIfAbsent("Black Olive", () => false);
    topping.putIfAbsent("Paneer Tikka", () => false);
  }
}
