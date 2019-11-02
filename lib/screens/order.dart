import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_delivery/code/customise.dart';
import 'package:pizza_delivery/code/orderList.dart';
import 'package:pizza_delivery/screens/home.dart';

import 'customize.dart';

class Order extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _order();
  }
}

class _order extends State<Order> {
  List<Customise> _list;
  int price;

  _order() {
    price = 0;
    _list = orderList.give();
  }

  @override
  Widget build(BuildContext context) {
    price = orderList.price();
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          backgroundColor: Colors.blue.shade800,
        ),
        body: Center(
          child: Container(
            child: ListView.builder(
              itemBuilder: (context, position) {
                return cardBuild(
                    context, position);
              },
              itemCount: _list.length,
            ),
          ),
        ),
        bottomSheet: Container(
          color: Colors.lightGreen.shade700,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                      child: Text(
                        '₹ $price',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                        ),
                      )
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: OutlineButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)
                  ),
                  padding: EdgeInsets.only(left: 5, right: 5),
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      orderList.destroy();
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    'PLACE ORDER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }

  Widget cardBuild(BuildContext context, int position) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Customize.named(_list.elementAt(position), position);
              }));
            },
            child: Image(
              width: 150,
              height: 100,
              image: AssetImage(_list
                  .elementAt(position)
                  .path),
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: Text(
                  '${_list
                      .elementAt(position)
                      .name}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),
                ),
              ),
//              Wrap(
//                crossAxisAlignment: WrapCrossAlignment.start,
//                children: <Widget>[
//                  Text(
//                      '${_list
//                          .elementAt(position)
//                          .desc}',overflow: TextOverflow.visible,
//                      style: TextStyle(
//                      )
//                  ),
//                ],
//              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                        '${_list
                            .elementAt(position)
                            .def_size}',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14
                        )
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 20,
                    width: 1,
                    color: Colors.black,
                  ),
                  SizedBox(width: 10,),
                  Container(
                    child: Text(
                        '${_list
                            .elementAt(position)
                            .def_crust}',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14
                        )
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: Text(
                      '₹ ${_list
                          .elementAt(position)
                          .price}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        orderList.delt(position);
                        if (orderList.size() == 0)
                          Navigator.pop(context);
                      });
                    },
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}