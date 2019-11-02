import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_delivery/code/customise.dart';

class Order extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _order();
  }
}

class _order extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
          backgroundColor: Colors.blue.shade800,
      ),
    );
  }

}