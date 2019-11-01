import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_delivery/code/customise.dart';
import 'package:pizza_delivery/code/pizza.dart';

class Customize extends StatefulWidget {
  Pizza pizza;

  Customize(Pizza pizza) {
    this.pizza = pizza;
  }

  @override
  State<StatefulWidget> createState() {
    return new _Customize(pizza);
  }
}

class _Customize extends State<Customize> {
  Customise _customz;
  Pizza _pizza;

  _Customize(Pizza pizza) {
    _pizza = pizza;
    _customz = new Customise(pizza);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(
                height: 200.0,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_pizza.path),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 5,
                    left: 5,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      iconSize: 30,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Positioned(
                    left: 10.0,
                    bottom: 10.0,
                    child: Text(
                      '₹ ${_customz.price}',
                      style: TextStyle(
                          fontSize: 23,
                          backgroundColor: Colors.transparent.withOpacity(0.05),
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(5, 0, 5, 20),
                child: Card(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: Text(
                          _pizza.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Text(
                            _pizza.desc,
                            style: TextStyle(fontWeight: FontWeight.w300),
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          'Select Size',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Row(
                            children: <Widget>[
                              FlatButton(
                                onPressed: () {},
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                color: Colors.grey.shade100,
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.local_pizza),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Text(
                                            Customise.sizes[0],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Text(
                                            'Serves 1',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FlatButton(
                                onPressed: () {},
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                color: Colors.grey.shade100,
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.local_pizza),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Text(
                                            Customise.sizes[1],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Text(
                                            'Serves 2',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FlatButton(
                                onPressed: () {},
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                color: Colors.grey.shade100,
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.local_pizza),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Text(
                                            Customise.sizes[2],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Text(
                                            'Serves 4',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          'Select Crust',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Row(
                              children: <Widget>[
                                FlatButton(
                                  onPressed: () {},
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  color: Colors.grey.shade100,
                                  child: Row(
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: Text(
                                              Customise.crusts[0],
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          Container(
                                            color: Colors.grey.shade300,
                                            padding: EdgeInsets.all(3),
                                            margin:
                                                EdgeInsets.only(top: 5, left: 5),
                                            child: Text(
                                              '₹ 199',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                FlatButton(
                                  onPressed: () {},
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  color: Colors.grey.shade100,
                                  child: Row(
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: Text(
                                              Customise.crusts[1],
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          Container(
                                            color: Colors.grey.shade300,
                                            padding: EdgeInsets.all(3),
                                            margin:
                                                EdgeInsets.only(top: 5, left: 5),
                                            child: Text(
                                              '₹ 249',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        color: Colors.grey.shade200,
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: _customz.cheese,
                              onChanged: (bool value) {
                                if (value) {
                                  setState(() {
                                    _customz.cheese = value;
                                    _customz.price = _pizza.price + 75;
                                  });
                                } else {
                                  setState(() {
                                    _customz.cheese = value;
                                    _customz.price = _pizza.price;
                                  });
                                }
                              },
                            ),
                            Text(
                              'Add Extra Cheese @ ₹75.00',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    'Toppings',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  margin: EdgeInsets.only(left: 10),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    'RESET',
                    style: TextStyle(
                      color: Colors.blue.shade800,
                    ),
                  ),
                )
              ],
            )),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
              child: Card(
                  elevation: 5,
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 15, top: 15),
                        child: Text(
                          'Add Veg Toppings @ ₹60.00 each',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 130,
                        child: ListView.builder(
                          shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                            itemBuilder: (context,position){
                              return cardBuild(context, position);
                            },
                          itemCount: Customise.toppings.length,
                        ),
                      ),
                      SizedBox(height: 20,)
                    ],
                  )),
            )
          ],
        )),
      ),
    );
  }
  Widget cardBuild(BuildContext context,int position){
    return Container(
      margin: EdgeInsets.only(left: 5,right: 5),
      child: FlatButton(
        onPressed: (){},
        child: Column(
            children: <Widget>[
              Image(
                height: 100,
                width: 100,
                image: AssetImage(Customise.toppingsPath.elementAt(position),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(Customise.toppings.elementAt(position),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),),
              )
            ],
          ),
      ),
    );
  }
}
