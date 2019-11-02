import 'package:flutter/cupertino.dart';

import 'customise.dart';

class orderList{

  static List<Customise> _list=<Customise>[];
  static int prc;

  static void add(Customise _customz){
    if (!_list.contains(_customz)) {
      _list.add(_customz);
    }
    else {
      debugPrint("NO");
    }
  }
  static int size(){
    return _list.length;
  }

  static List<Customise> give() {
    return _list;
  }

  static void delt(int position) {
    _list.removeAt(position);
  }

  static int price() {
    prc = 0;
    _list.forEach((Customise custom) {
      prc += custom.price;
    });
    return prc;
  }
  static destroy(){
    _list.clear();
  }
}