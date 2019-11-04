import 'package:pizza_delivery/code/pizza.dart';

class Customise {
  static List<String> sizes = <String>['Small', 'Medium', 'Large'];

  static List<String> toppingsV = <String>[
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
  static List<String> toppingsPathV = <String>[
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

  static List<String> toppingsNV = <String>[
    'Pepper Barbecue Chicken',
    'Peri - Peri Chicken',
    'Grilled Chicken Rasher',
    'Chicken Sausage',
    'Chicken Tikka',
  ];
  static List<String> toppingsPathNV = <String>[
    'images/toppingsBarbeque.jpg',
    'images/toppingsPeriPeriChicken.jpg',
    'images/toppingsGrilledChickenRasher.jpg',
    'images/toppingsChickenSausage.jpg',
    'images/toppingsChickenTikka.jpg',
    'images/toppingsOnion.jpg',
  ];

  String def_size = sizes.elementAt(1);

  List<String> crusts;

  String def_crust;

  bool veg;

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

  Map<String, bool> toppingV = new Map<String, bool>();
  Map<String, bool> toppingNV = new Map<String, bool>();

  static List SmallTP=[35,50];
  static List MediumTP=[60,75];
  static List LargeTP=[80,95];

  List<String> AllT;

  Customise(Pizza pizza) {
    AllT=[];
    path=pizza.path;
    veg=pizza.veg;
    name=pizza.name;
    desc=pizza.desc;
    price = pizza.price;

    cheese = false;

    crusts = Mediumcrusts;
    def_crust = Mediumcrusts.elementAt(0);

    toppingV.putIfAbsent("Onion", () => false);
    toppingV.putIfAbsent("Fresh Tomato", () => false);
    toppingV.putIfAbsent("Grilled Mushrooms", () => false);
    toppingV.putIfAbsent("Paneer", () => false);
    toppingV.putIfAbsent("Jalapeno", () => false);
    toppingV.putIfAbsent("Red Paprika", () => false);
    toppingV.putIfAbsent("Golden Corn", () => false);
    toppingV.putIfAbsent("Crisp Capsicum", () => false);
    toppingV.putIfAbsent("Black Olive", () => false);
    toppingV.putIfAbsent("Paneer Tikka", () => false);

    toppingNV.putIfAbsent("Pepper Barbecue Chicken", () => false);
    toppingNV.putIfAbsent("Peri - Peri Chicken", () => false);
    toppingNV.putIfAbsent("Grilled Chicken Rasher", () => false);
    toppingNV.putIfAbsent("Chicken Sausage", () => false);
    toppingNV.putIfAbsent("Chicken Tikka", () => false);

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
      case 'Chicken Sausage':
        Smallprices = [165, 240, 195, 165, 450];
        Mediumprices = [305, 355, 404, 345, 450];
        Largeprices = [495, 355, 404, 345, 450];
        break;
      case 'Pepper Barbecue Chicken':
        Smallprices = [185, 260, 215, 185, 450];
        Mediumprices = [335, 385, 434, 375, 450];
        Largeprices = [535, 385, 434, 375, 450];
        break;
      case 'Pepper Barbecue & Onion':
        Smallprices = [215, 290, 245, 215, 450];
        Mediumprices = [395, 445, 494, 435, 450];
        Largeprices = [595, 445, 494, 435, 450];
        break;
      case 'Chicken Pepperoni':
        Smallprices = [305, 380, 335, 305, 450];
        Mediumprices = [570, 620, 669, 610, 450];
        Largeprices = [835, 620, 669, 610, 450];
        break;
      case 'Non Veg Supreme':
        Smallprices = [305, 380, 335, 305, 450];
        Mediumprices = [570, 620, 669, 610, 450];
        Largeprices = [835, 620, 669, 610, 450];
        break;
    }
    prices = Mediumprices;
  }

  Customise.custom(Customise customise) {
    AllT=customise.AllT;
    path=customise.path;
    veg=customise.veg;
    name=customise.name;
    desc=customise.desc;
    price = customise.price;

    cheese = customise.cheese;
    
    def_size=customise.def_size;

    crusts = customise.crusts;

    def_crust = customise.def_crust;
    
    toppingV.addAll(customise.toppingV);
    toppingNV.addAll(customise.toppingNV);

    Smallprices=customise.Smallprices;
    Mediumprices=customise.Mediumprices;
    Largeprices=customise.Largeprices;

    prices=customise.prices;
  }
}
