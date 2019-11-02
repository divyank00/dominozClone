import 'package:flutter/cupertino.dart';
import 'customise.dart';

class orderList{

  static List<Customise> _list=<Customise>[];

  static void add(Customise _customz){
    debugPrint('Right');
    _list.add(_customz);
  }
  static int size(){
    return _list.length;
  }
}