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
  int cheesePrice = Customise.Mediumcheese;
  Customise _customz;
  Pizza _pizza;

  Color smallC = Colors.transparent,
      mediumC = Colors.blue.shade800,
      largeC = Colors.transparent;
  Color smallCF = Colors.black,
      mediumCF = Colors.blue.shade800,
      largeCF = Colors.black;
  Color NHT = Colors.blue.shade800,
      CB = Colors.transparent,
      FPP = Colors.transparent,
      CHT = Colors.transparent,
      WTC = Colors.transparent;

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
                              backgroundColor: Colors.transparent.withOpacity(
                                  0.05),
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
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        changeSize(0);
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              2),
                                          side: BorderSide(
                                            color: smallC,
                                          )
                                      ),
                                      padding: EdgeInsets.fromLTRB(
                                          10, 10, 10, 10),
                                      color: Colors.grey.shade100,
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.local_pizza,
                                            color: smallCF,
                                            size: 30,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 5),
                                                child: Text(
                                                  Customise.sizes[0],
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .w600,
                                                      color: smallCF
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 5, top: 1),
                                                child: Text(
                                                  'Serves 1',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .w300,
                                                      color: smallCF,
                                                      fontSize: 12
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
                                      onPressed: () {
                                        changeSize(1);
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              2),
                                          side: BorderSide(
                                            color: mediumC,
                                          )
                                      ),
                                      padding: EdgeInsets.fromLTRB(
                                          10, 10, 10, 10),
                                      color: Colors.grey.shade100,
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.local_pizza,
                                            color: mediumCF,
                                            size: 30,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 5),
                                                child: Text(
                                                  Customise.sizes[1],
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .w600,
                                                      color: mediumCF
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 5, top: 1),
                                                child: Text(
                                                  'Serves 2',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .w300,
                                                      color: mediumCF,
                                                      fontSize: 12
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
                                      onPressed: () {
                                        changeSize(2);
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              2),
                                          side: BorderSide(
                                            color: largeC,
                                          )
                                      ),
                                      padding: EdgeInsets.fromLTRB(
                                          10, 10, 10, 10),
                                      color: Colors.grey.shade100,
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.local_pizza,
                                            color: largeCF,
                                            size: 30,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 5),
                                                child: Text(
                                                  Customise.sizes[0],
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .w600,
                                                      color: largeCF
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 5, top: 1),
                                                child: Text(
                                                  'Serves 4',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .w300,
                                                      color: largeCF,
                                                      fontSize: 12
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
                            padding: EdgeInsets.only(left: 5, right: 5),
                            height: 55,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, position) {
                                return crustBuild(context, position);
                              },
                              itemCount: 5,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              cheeseAdd(!_customz.cheese);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                              child: Row(
                                children: <Widget>[
                                  Checkbox(
                                      value: _customz.cheese,
                                      onChanged: (bool value) {
                                        cheeseAdd(value);
                                      }
                                  ),
                                  Text(
                                    'Add Extra Cheese @ ₹$cheesePrice',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          margin: EdgeInsets.only(left: 10),
                        ),
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              _customz.topping.forEach((String str, bool val) {
                                if (val == true) {
                                  _customz.topping.update(str, (bool val) {
                                    return false;
                                  });
                                }
                              });
                            });
                          },
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
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, position) {
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

  void cheeseAdd(bool value) {
    if (value) {
      setState(() {
        _customz.cheese = value;
        if (_customz.def_size == 'Small')
          _customz.price += Customise.Smallcheese;
        else if (_customz.def_size == 'Medium')
          _customz.price +=
              Customise.Mediumcheese;
        else
          _customz.price +=
              Customise.Largecheese;
      });
    } else {
      setState(() {
        _customz.cheese = value;
        if (_customz.def_size == 'Small')
          _customz.price -= Customise.Smallcheese;
        else if (_customz.def_size == 'Medium')
          _customz.price -=
              Customise.Mediumcheese;
        else
          _customz.price -=
              Customise.Largecheese;
      });
    }
  }

  Widget crustBuild(BuildContext context, int position) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: FlatButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
            side: BorderSide(
              color: mediumC,
            )
        ),
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        color: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  left: 5),
              child: Text(
                Customise.crusts[0],
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,),
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
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget cardBuild(BuildContext context,int position){
    return Container(
      margin: EdgeInsets.only(left: 5,right: 5),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ), onPressed: () {
        if (_customz.topping.values.elementAt(position) == true) {
          setState(() {
            _customz.topping[Customise.toppings.elementAt(position)] = false;
            _customz.price -= 60;
          });
        }
        else
          setState(() {
            _customz.topping[Customise.toppings.elementAt(position)] = true;
            _customz.price += 60;
          });
      },
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image(
                  height: 100,
                  width: 100,
                  image: AssetImage(Customise.toppingsPath.elementAt(position)
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Checkbox(
                    value: _customz.topping.values.elementAt(position),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(Customise.toppings.elementAt(position),
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 11
                ),),
            )
          ],
        ),
      ),
    );
  }

  void changeSize(int position) {
    setState(() {
      _customz.def_size = Customise.sizes.elementAt(position);
      switch (_customz.def_size) {
        case 'Small':
          _customz.cheese = false;
          smallC = Colors.blue.shade800;
          mediumC = Colors.transparent;
          largeC = Colors.transparent;
          smallCF = Colors.blue.shade800;
          mediumCF = Colors.black;
          largeCF = Colors.black;
          _customz.price = _customz.Smallprices.elementAt(0);
          cheesePrice = Customise.Smallcheese;
          _customz.topping.forEach((String str, bool val) {
            if (val == true) {
              _customz.topping.update(str, (bool val) {
                return false;
              });
            }
          });
          break;
        case 'Medium':
          _customz.cheese = false;
          smallC = Colors.transparent;
          mediumC = Colors.blue.shade800;
          largeC = Colors.transparent;
          smallCF = Colors.black;
          mediumCF = Colors.blue.shade800;
          largeCF = Colors.black;
          _customz.price = _customz.Mediumprices.elementAt(0);
          cheesePrice = Customise.Mediumcheese;
          _customz.topping.forEach((String str, bool val) {
            if (val == true) {
              _customz.topping.update(str, (bool val) {
                return false;
              });
            }
          });
          break;
        case 'Large':
          _customz.cheese = false;
          smallC = Colors.transparent;
          mediumC = Colors.transparent;
          largeC = Colors.blue.shade800;
          smallCF = Colors.black;
          mediumCF = Colors.black;
          largeCF = Colors.blue.shade800;
          _customz.price = _customz.Largeprices.elementAt(0);
          cheesePrice = Customise.Largecheese;
          _customz.topping.forEach((String str, bool val) {
            if (val == true) {
              _customz.topping.update(str, (bool val) {
                return false;
              });
            }
          });
          break;
      }
    });
  }
}
