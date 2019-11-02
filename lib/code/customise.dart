import 'package:pizza_delivery/code/pizza.dart';

class Customise {
  static List<String> sizes = <String>['Small', 'Medium', 'Large'];

  static List<String> toppings = <String>[
    'Onion',
    'Fresh Tomato',
    'Grilled Mushrooms',
    'Paneer',
    'Jalapeno',
    'Red Paprika',
    'Golden Corn',
    'Crisp Capsicum',
    'Black Olive',
    'Paneer Tikka'
  ];
  static List<String> toppingsPath = <String>[
    'images/toppingsOnion.jpg',
    'images/toppingsTomato.jpg',
    'images/toppingsMushroom.jpg',
    'images/toppingsPaneer.jpg',
    'images/toppingsJalapeno.jpg',
    'images/toppingsPaparika.jpg',
    'images/toppingsGoldenCorn.jpg',
    'images/toppingsCapsicum.jpg',
    'images/toppingsOlives.jpg',
    'images/paneerTikka.jpg'
  ];

  String def_size = sizes.elementAt(1);

  List<String> crusts;

  String def_crust;

  static List<String> Smallcrusts = <String>[
    'New Hand Tossed',
    'Cheese Burst',
    'Fresh Pan Pizza',
    'Classic Hand Tossed',
    'Wheat Thin Crust'
  ];
  List<int> Smallprices;

  static List<String> Mediumcrusts = <String>[
    'New Hand Tossed',
    'Wheat Thin Crust',
    'Cheese Burst',
    'Fresh Pan Pizza',
    'Classic Hand Tossed'
  ];
  List<int> Mediumprices;

  static List<String> Largecrusts = <String>[
    'New Hand Tossed',
    'Classic Hand Tossed',
    'Fresh Pan Pizza',
    'Cheese Burst',
    'Wheat Thin Crust'
  ];
  List<int> Largeprices;

  List<int> prices;

  String path,name, desc;

  int price;

  bool cheese;
  static int Smallcheese = 50;
  static int Mediumcheese = 75;
  static int Largecheese = 95;

  Map<String, bool> topping = new Map<String, bool>();

  Customise(Pizza pizza) {
    path=pizza.path;
    name=pizza.name;
    desc=pizza.desc;
    price = pizza.price;

    cheese = false;

    crusts = Mediumcrusts;
    def_crust = Mediumcrusts.elementAt(0);

    topping.putIfAbsent("Onion", () => false);
    topping.putIfAbsent("Fresh Tomato", () => false);
    topping.putIfAbsent("Grilled Mushrooms", () => false);
    topping.putIfAbsent("Paneer", () => false);
    topping.putIfAbsent("Jalapeno", () => false);
    topping.putIfAbsent("Red Paprika", () => false);
    topping.putIfAbsent("Golden Corn", () => false);
    topping.putIfAbsent("Crisp Capsicum", () => false);
    topping.putIfAbsent("Black Olive", () => false);
    topping.putIfAbsent("Paneer Tikka", () => false);

    switch (name) {
      case 'Margherita':
        Smallprices = [99, 174, 129, 99, 450];
        Mediumprices = [199, 249, 298, 239, 450];
        Largeprices = [395, 249, 298, 239, 450];
        break;
      case 'Cheese n Corn':
        Smallprices = [165, 240, 195, 165, 450];
        Mediumprices = [305, 355, 404, 345, 450];
        Largeprices = [495, 355, 404, 345, 450];
        break;
      case 'Cheese n Tomato':
        Smallprices = [165, 240, 195, 165, 450];
        Mediumprices = [305, 355, 404, 345, 450];
        Largeprices = [495, 355, 404, 345, 450];
        break;
      case 'Farmhouse':
        Smallprices = [215, 290, 245, 215, 450];
        Mediumprices = [395, 445, 494, 435, 450];
        Largeprices = [595, 445, 494, 435, 450];
        break;
      case 'Peppy Paneer':
        Smallprices = [215, 290, 245, 215, 450];
        Mediumprices = [395, 445, 494, 435, 450];
        Largeprices = [595, 445, 494, 435, 450];
        break;
    }
    prices = Mediumprices;
  }
}
