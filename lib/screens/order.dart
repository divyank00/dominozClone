import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pizza_delivery/code/customise.dart';
import 'package:pizza_delivery/code/orderList.dart';

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
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Image(
                    width: 150,
                    height: 120,
                    image: AssetImage(_list
                        .elementAt(position)
                        .path),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 5,
                  bottom: 5,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue.shade400,
                        )
                    ),
                    child: Icon(
                      Icons.edit,
                      color: Colors.blue.shade400,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
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
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 190,
                  child: Row(children: <Widget>[
                    Flexible(
                      child: Text(
                          '${_list
                              .elementAt(position)
                              .desc}',
                          style: TextStyle(
                              fontWeight: FontWeight.w300
                          )
                      ),
                    ),
                  ],
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  padding: EdgeInsets.only(bottom: 0),
                  child: Row(
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
                        width: MediaQuery.of(context).size.width-280,
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                  '${_list
                                      .elementAt(position)
                                      .def_crust}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14
                                  )
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 180,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        padding: EdgeInsets.all(0),
                        icon: Icon(Icons.delete,
                          size: 30,),
                        onPressed: () {
                          setState(() {
                            showDialog(context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    titlePadding: EdgeInsets.fromLTRB(
                                        0, 0, 0, 0),
                                    title: Container(
                                      padding: EdgeInsets.fromLTRB(
                                          5, 10, 0, 10),
                                      color: Colors.blue.shade800,
                                      child: Text('Remove Item',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.fromLTRB(
                                        12, 15, 12, 0),
                                    content: Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        'Are you sure you want to remove this item?',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    actions: <Widget>[
                                      Container(
                                        height: 30,
                                        margin: EdgeInsets.only(right: 10),
                                        padding: EdgeInsets.fromLTRB(
                                            15, 0, 15, 0),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black,
                                            )
                                        ),
                                        child: FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }, child: Container(
                                          child: Text(
                                            'NO',
                                            style: TextStyle(

                                            ),
                                          ),
                                        ),
                                        ),
                                      ),
                                      Container(
                                        height: 30,
                                        padding: EdgeInsets.fromLTRB(
                                            15, 0, 15, 0),
                                        decoration: BoxDecoration(
                                            color: Colors.lightGreen.shade700,
                                            border: Border.all(
                                              color: Colors.black,
                                            )
                                        ),
                                        child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              orderList.delt(position);
                                            });
                                            Navigator.pop(context);
                                            if (orderList.size() == 0)
                                              Navigator.pop(context);
                                          },
                                          child: Container(
                                            child: Text(
                                              'YES',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                });
                          });
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}