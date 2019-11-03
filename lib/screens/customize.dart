import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pizza_delivery/code/customise.dart';
import 'package:pizza_delivery/code/orderList.dart';
import 'package:pizza_delivery/code/pizza.dart';


class Customize extends StatefulWidget {
  Pizza pizza;
  Customise customise;
  int position;

  Customize(Pizza pizza) {
    this.pizza = pizza;
  }

  Customize.named(Customise customise,int position){
    this.customise = customise;
    this.position=position;
  }

  @override
  State<StatefulWidget> createState() {
    return _Customize(pizza, customise,position);
  }
}

class _Customize extends State<Customize> {
  int cheesePrice = Customise.Mediumcheese;
  Customise _customz,_customz1;
  String crust;

  List<bool> allowed;

  Color smallC, mediumC, largeC;
  Color smallCF, mediumCF, largeCF;
  List<Color> border;
  List<Color> font;

  String str='ADD TO CART';
  bool flag=true;

  int position;

  _Customize(Pizza pizza, Customise customise,int position) {
    if (customise == null) {
      _customz = new Customise(pizza);
      crust = _customz.def_crust;
      allowed = [true, true, true, true, false];
      smallC = Colors.transparent;
      mediumC = Colors.blue.shade800;
      largeC = Colors.transparent;
      smallCF = Colors.black;
      mediumCF = Colors.blue.shade800;
      largeCF = Colors.black;
      border = [
        Colors.blue.shade800,
        Colors.transparent,
        Colors.transparent,
        Colors.transparent,
        Colors.transparent
      ];
      font = [
        Colors.blue.shade800,
        Colors.black,
        Colors.black,
        Colors.black,
        Colors.black
      ];
    }
    else {
      _customz = customise;
      _customz1 = new Customise.custom(customise);

      changeColorsS();
      changeColorsC();
      if (_customz.cheese == true) {
        if (_customz.def_size == Customise.sizes.elementAt(0))
          _customz.price += Customise.Smallcheese;
        else if (_customz.def_size == Customise.sizes.elementAt(1))
          _customz.price += Customise.Mediumcheese;
        else
          _customz.price += Customise.Largecheese;
      }
      _customz.topping.forEach((String str, bool val) {
        if (val == true) {
          _customz.price+=60;
        }
      });
      str='UPDATE CART';
      flag=false;
      this.position=position;
    }
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          titlePadding: EdgeInsets.fromLTRB(
              0, 0, 0, 0),
          title: Container(
            padding: EdgeInsets.fromLTRB(
                5, 10, 0, 10),
            color: Colors.blue.shade800,
            child: Text('Save Changes',
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
              'Are you sure you want to save this changes?',
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
                  setState(() {
                    orderList.delt(position);
                    orderList.addat(_customz1, position);
                  });
                  Navigator.pop(context);
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
                    update();
                  });
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
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: flag ? null : _onWillPop,
      child: Scaffold(
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
                            image: AssetImage(_customz.path),
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
                                  flag?Navigator.pop(context):_onWillPop();
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
                                    backgroundColor: Colors.transparent
                                        .withOpacity(
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
                                    _customz.name,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                    child: Text(
                                      _customz.desc,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300),
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
                                            highlightColor: Colors.blue.shade200
                                                .withOpacity(0.3),
                                            onPressed: () {
                                              changeSize(0);
                                            },
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    4),
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
                                            highlightColor: Colors.blue.shade200
                                                .withOpacity(0.3),
                                            onPressed: () {
                                              changeSize(1);
                                            },
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    4),
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
                                            highlightColor: Colors.blue.shade200
                                                .withOpacity(0.3),
                                            onPressed: () {
                                              changeSize(2);
                                            },
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    4),
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
                                                        Customise.sizes[2],
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
                                    _customz.topping.forEach((String str,
                                        bool val) {
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
                                SizedBox(height: 10,)
                              ],
                            )),
                      ),
                      SizedBox(height: 60,)
                    ],
                  )),
          ),
          bottomSheet: Container(
            color: Colors.blue.shade800,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                        child: Text(
                          '1 item',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                    ),
                    Container(
                      height: 12,
                      width: 2,
                      color: Colors.blue.shade400,
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text(
                          '₹ ${_customz.price}',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w700
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
                      flag ? add() : update();
                    },
                    child: Text('$str',
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
      ),
    );
  }

  void add(){
    orderList.add(_customz);
    Navigator.pop(context);
  }
  
  void update(){
    orderList.delt(position);
    orderList.addat(_customz, position);
    Navigator.pop(context);
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
      child: Opacity(
        opacity: allowed.elementAt(position) ? 1 : 0.3,
        child: FlatButton(
          onPressed: () {
            setState(() {
              allowed.elementAt(position) ?
              _customz.price = _customz.prices.elementAt(position) : null;
              allowed.elementAt(position) ? changeCrust(position) : null;
            });
          },
          splashColor: allowed.elementAt(position) ? Colors.white : Colors
              .transparent,
          highlightColor: allowed.elementAt(position) ? Colors.blue.shade200
              .withOpacity(0.3) : Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(
                color: border.elementAt(position),
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
                  _customz.crusts.elementAt(position),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: font.elementAt(position),
                  ),
                ),
              ),
              Container(
                color: Colors.grey.shade300,
                padding: EdgeInsets.all(3),
                margin: EdgeInsets.only(top: 5, left: 5),
                child: Text('₹ ${_customz.prices.elementAt(position)}',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: font.elementAt(position),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cardBuild(BuildContext context,int position){
    return Container(
      decoration: BoxDecoration(
        color:(_customz.topping[Customise.toppings.elementAt(position)]==true)?Colors.blue.withOpacity(0.15):Colors.transparent,
      ),
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
                Container(
                  child: Image.asset(Customise.toppingsPath.elementAt(position),
                    height: 100,
                      width: 100,
                    colorBlendMode: BlendMode.darken,
                    color:(_customz.topping[Customise.toppings.elementAt(position)]==true)?Colors.blue.withOpacity(0.15):Colors.transparent,
                  )
//                  Image(
//                    height: 100,
//                    width: 100,
//                    image: AssetImage(Customise.toppingsPath.elementAt(position),
//
//                    ),
//                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Checkbox(
                    value: _customz.topping.values.elementAt(position),
                    onChanged: (bool value) {

                    },
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
      _customz.def_crust=_customz.crusts.elementAt(0);
      _customz.cheese = false;
      _customz.topping.forEach((String str, bool val) {
        if (val == true) {
          _customz.topping.update(str, (bool val) {
            return false;
          });
        }
      });
      changeColorsS();
    });
  }

  void changeCrust(int position) {
    setState(() {
      _customz.def_crust = _customz.crusts.elementAt(position);
      _customz.cheese = false;
      _customz.topping.forEach((String str, bool val) {
        if (val == true) {
          _customz.topping.update(str, (bool val) {
            return false;
          });
        }
      });
      changeColorsC();
    });
  }

  void changeColorsS() {
    switch (_customz.def_size) {
      case 'Small':
        smallC = Colors.blue.shade800;
        mediumC = Colors.transparent;
        largeC = Colors.transparent;
        smallCF = Colors.blue.shade800;
        mediumCF = Colors.black;
        largeCF = Colors.black;
        _customz.price = _customz.Smallprices.elementAt(0);
        cheesePrice = Customise.Smallcheese;

        _customz.crusts = Customise.Smallcrusts;
        _customz.prices = _customz.Smallprices;

        border = [
          Colors.blue.shade800,
          Colors.transparent,
          Colors.transparent,
          Colors.transparent,
          Colors.transparent
        ];
        font = [
          Colors.blue.shade800,
          Colors.black,
          Colors.black,
          Colors.black,
          Colors.black
        ];

        allowed = [true, true, true, true, false];


        break;
      case 'Medium':
        smallC = Colors.transparent;
        mediumC = Colors.blue.shade800;
        largeC = Colors.transparent;
        smallCF = Colors.black;
        mediumCF = Colors.blue.shade800;
        largeCF = Colors.black;
        _customz.price = _customz.Mediumprices.elementAt(0);
        cheesePrice = Customise.Mediumcheese;

        _customz.crusts = Customise.Mediumcrusts;
        _customz.prices = _customz.Mediumprices;

        border = [
          Colors.blue.shade800,
          Colors.transparent,
          Colors.transparent,
          Colors.transparent,
          Colors.transparent
        ];
        font = [
          Colors.blue.shade800,
          Colors.black,
          Colors.black,
          Colors.black,
          Colors.black
        ];



        allowed = [true, true, true, true, false];

        break;
      case 'Large':
        smallC = Colors.transparent;
        mediumC = Colors.transparent;
        largeC = Colors.blue.shade800;
        smallCF = Colors.black;
        mediumCF = Colors.black;
        largeCF = Colors.blue.shade800;
        _customz.price = _customz.Largeprices.elementAt(0);
        cheesePrice = Customise.Largecheese;

        _customz.crusts = Customise.Largecrusts;
        _customz.prices = _customz.Largeprices;

        border = [
          Colors.blue.shade800,
          Colors.transparent,
          Colors.transparent,
          Colors.transparent,
          Colors.transparent
        ];
        font = [
          Colors.blue.shade800,
          Colors.black,
          Colors.black,
          Colors.black,
          Colors.black
        ];

        allowed = [true, false, false, false, false];

        break;
    }
  }

  void changeColorsC() {
    switch (_customz.def_size) {
      case 'Small':
        switch (_customz.def_crust) {
          case 'New Hand Tossed':
            border = [
              Colors.blue.shade800,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent
            ];
            font = [
              Colors.blue.shade800,
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.black
            ];
            _customz.price=_customz.prices.elementAt(0);
            break;
          case 'Cheese Burst':
            border = [
              Colors.transparent,
              Colors.blue.shade800,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent
            ];
            font = [
              Colors.black,
              Colors.blue.shade800,
              Colors.black,
              Colors.black,
              Colors.black
            ];
            _customz.price=_customz.prices.elementAt(1);
            break;
          case 'Fresh Pan Pizza':
            border = [
              Colors.transparent,
              Colors.transparent,
              Colors.blue.shade800,
              Colors.transparent,
              Colors.transparent
            ];
            font = [
              Colors.black,
              Colors.black,
              Colors.blue.shade800,
              Colors.black,
              Colors.black
            ];
            _customz.price=_customz.prices.elementAt(2);
            break;
          case 'Classic Hand Tossed':
            border = [
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.blue.shade800,
              Colors.transparent
            ];
            font = [
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.blue.shade800,
              Colors.black
            ];
            _customz.price=_customz.prices.elementAt(3);
            break;
          case 'Wheat Thin Crust':
            border = [
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.blue.shade800,
            ];
            font = [
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.blue.shade800,
            ];
            _customz.price=_customz.prices.elementAt(4);
            break;
        }
        break;
      case 'Medium':
        switch (_customz.def_crust) {
          case 'New Hand Tossed':
            border = [
              Colors.blue.shade800,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent
            ];
            font = [
              Colors.blue.shade800,
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.black
            ];
            _customz.price=_customz.prices.elementAt(0);
            break;
          case 'Wheat Thin Crust':
            border = [
              Colors.transparent,
              Colors.blue.shade800,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent
            ];
            font = [
              Colors.black,
              Colors.blue.shade800,
              Colors.black,
              Colors.black,
              Colors.black
            ];
            _customz.price=_customz.prices.elementAt(1);
            break;
          case 'Cheese Burst':
            border = [
              Colors.transparent,
              Colors.transparent,
              Colors.blue.shade800,
              Colors.transparent,
              Colors.transparent
            ];
            font = [
              Colors.black,
              Colors.black,
              Colors.blue.shade800,
              Colors.black,
              Colors.black
            ];
            _customz.price=_customz.prices.elementAt(2);
            break;
          case 'Fresh Pan Pizza':
            border = [
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.blue.shade800,
              Colors.transparent
            ];
            font = [
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.blue.shade800,
              Colors.black
            ];
            _customz.price=_customz.prices.elementAt(3);
            break;
          case 'Classic Hand Tossed':
            border = [
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.blue.shade800,
            ];
            font = [
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.blue.shade800,
            ];
            _customz.price=_customz.prices.elementAt(4);
            break;
        }
        break;
      case 'Large':
        switch (_customz.def_crust) {
          case 'New Hand Tossed':
            border = [
              Colors.blue.shade800,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent
            ];
            font = [
              Colors.blue.shade800,
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.black
            ];
            _customz.price=_customz.prices.elementAt(0);
            break;
          case 'Classic Hand Tossed':
            border = [
              Colors.transparent,
              Colors.blue.shade800,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent
            ];
            font = [
              Colors.black,
              Colors.blue.shade800,
              Colors.black,
              Colors.black,
              Colors.black
            ];
            _customz.price=_customz.prices.elementAt(1);
            break;
          case 'Fresh Pan Pizza':
            border = [
              Colors.transparent,
              Colors.transparent,
              Colors.blue.shade800,
              Colors.transparent,
              Colors.transparent
            ];
            font = [
              Colors.black,
              Colors.black,
              Colors.blue.shade800,
              Colors.black,
              Colors.black
            ];
            _customz.price=_customz.prices.elementAt(2);
            break;
          case 'Cheese Burst':
            border = [
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.blue.shade800,
              Colors.transparent
            ];
            font = [
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.blue.shade800,
              Colors.black
            ];
            _customz.price=_customz.prices.elementAt(3);
            break;
          case 'Wheat Thin Crust':
            border = [
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.blue.shade800,
            ];
            font = [
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.blue.shade800,
            ];
            _customz.price=_customz.prices.elementAt(4);
            break;
        }
        break;
    }
  }
  
}
