import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pizza_delivery/code/orderList.dart';
import 'package:pizza_delivery/code/pizza.dart';
import 'package:pizza_delivery/screens/customize.dart';

import 'order.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    getDataV();
    getDataNV();
    return _home();
  }
}

class _home extends State<Home> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, bool flag) {
              return <Widget>[
                SliverAppBar(
                  snap: true,
                  pinned: true,
                  floating: true,
                  title: Text('Explore'),
                  backgroundColor: Colors.blue.shade800,
                  bottom: TabBar(
//                    isScrollable: true,
                    controller: controller,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey.shade400,
                    indicatorColor: Colors.lightGreen.shade700,
                    tabs: [
                      Tab(text: 'VEG PIZZA'),
                      Tab(text: 'NON-VEG PIZZA'),
                    ],
                  ),
                ),
              ];
            },

            body: TabBarView(
              controller: controller,
              children: <Widget>[
                Container(
                  child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: Padding(
                      padding: orderList.size() == 0
                          ? EdgeInsets.fromLTRB(3, 3, 3, 0)
                          : EdgeInsets.fromLTRB(3, 3, 3, 48),
                      child: ListView.builder(
                        itemBuilder: (context, index) =>
                            cardBuildV(context,
                                getDataV().elementAt(index),
                                index),
                        itemCount: getDataV().length,

                      ),
                    ),
                  ),
                ),
                Container(
                  child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: Padding(
                      padding: orderList.size() == 0
                          ? EdgeInsets.fromLTRB(3, 3, 3, 0)
                          : EdgeInsets.fromLTRB(3, 3, 3, 48),
                      child: ListView.builder(
                        itemBuilder: (context, index) =>
                            cardBuildNV(context,
                                getDataNV().elementAt(index),
                                index),
                        itemCount: getDataNV().length,

                      ),
                    ),
                  ),
                ),
              ],
            )
        ),
        bottomSheet: orderList.size()==0?null:Container(
          color: Colors.lightGreen.shade700,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                      child: Text(
                        'Cart : ${orderList.size()} Items',
                        style: TextStyle(
                          color: Colors.white,
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
                    debugPrint(orderList.size().toString());
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) {
                      return Order();
                    }));
                  },
                  child: Text(
                    'VIEW CART',
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

  Widget cardBuildV(BuildContext context, Pizza pizza, int position) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 4,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return Customize(getDataV().elementAt(position));
              }
          ));
        },
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints.expand(
                    height: 125.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    image: DecorationImage(
                      image: AssetImage(pizza.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 5.0,
                        bottom: 5.0,
                        child: Text(
                          '₹ ${pizza.price}',
                          style: TextStyle(
                              fontSize: 23,
                              backgroundColor: Colors.transparent.withOpacity(
                                  0.05),
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      ButtonTheme(
                          height: 30,
                          child: Positioned(
                              right: 5.0,
                              bottom: 0.0,
                              child: RaisedButton(
                                  color: Colors.grey.shade200
                                      .withOpacity(0.9),
                                  padding:
                                  EdgeInsets.fromLTRB(10, 0, 5, 0),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return Customize(
                                              getDataV().elementAt(position));
                                        }));
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        'CUSTOMISE',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight:
                                            FontWeight.w500),
                                      ),
                                      SizedBox(width: 5),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.blue,
                                        size: 12,
                                      ),
                                      SizedBox(width: 5,)
                                    ],
                                  ))))
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.only(left: 6),
                  alignment: Alignment.topLeft,
                  child: Text(
                    pizza.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.only(left: 6),
                  alignment: Alignment.topLeft,
                  child: Text(
                    pizza.desc,
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(height: 10)
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget cardBuildNV(BuildContext context, Pizza pizza, int position) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 4,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return Customize(getDataNV().elementAt(position));
              }
          ));
        },
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints.expand(
                    height: 125.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    image: DecorationImage(
                      image: AssetImage(pizza.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 5.0,
                        bottom: 5.0,
                        child: Text(
                          '₹ ${pizza.price}',
                          style: TextStyle(
                              fontSize: 23,
                              backgroundColor: Colors.transparent.withOpacity(
                                  0.05),
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      ButtonTheme(
                          height: 30,
                          child: Positioned(
                              right: 5.0,
                              bottom: 0.0,
                              child: RaisedButton(
                                  color: Colors.grey.shade200
                                      .withOpacity(0.9),
                                  padding:
                                  EdgeInsets.fromLTRB(10, 0, 5, 0),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return Customize(
                                              getDataV().elementAt(position));
                                        }));
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        'CUSTOMISE',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight:
                                            FontWeight.w500),
                                      ),
                                      SizedBox(width: 5),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.blue,
                                        size: 12,
                                      ),
                                      SizedBox(width: 5,)
                                    ],
                                  ))))
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.only(left: 6),
                  alignment: Alignment.topLeft,
                  child: Text(
                    pizza.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.only(left: 6),
                  alignment: Alignment.topLeft,
                  child: Text(
                    pizza.desc,
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(height: 10)
              ],
            ),
          ],
        ),
      ),
    );
  }

}

List getDataV() {
    return[
      Pizza(
        'images/margherita.jpg',
        199,
        true,
        'Margherita',
        'Classic delight with 100% real mozzarella cheese'
      ),
      Pizza(
          'images/cheese_and_corn.png',
          305,
          true,
          'Cheese n Corn',
          'A delectable combination of sweet & juicy golden corn'
      ),
      Pizza(
          'images/cheese_and_tomato.png',
          305,
          true,
          'Cheese n Tomato',
          'A delectable combination of cheese and juicy tomato'
      ),
      Pizza(
          'images/farmhouse.png',
          395,
          true,
          'Farmhouse',
          'Delightful combination of onion, capsicum, tomato & grilled mushroom'
      ),Pizza(
          'images/peppypaneer.png',
          395,
          true,
          'Peppy Paneer',
          'Flavorful trio of juicy paneer, crisp capsicum with spicy red paprika'
      ),
    ];
  }

List getDataNV() {
  return [
    Pizza(
        'images/Chicken_Sausage.png',
        305,
        false,
        'Chicken Sausage',
        'American classic! Spicy, herbed chicken sausage on pizza'
    ),
    Pizza(
        'images/PepperBarbequeChickenC.jpg',
        335,
        false,
        'Pepper Barbecue Chicken',
        'Pepper barbecue chicken for that extra zing'
    ),
    Pizza(
        'images/PepperBarbequeOnionC.jpg',
        395,
        false,
        'Pepper Barbecue & Onion',
        'A classic favourite with pepper barbeque chicken & onion'
    ),
    Pizza(
        'images/cheesepepperoni.png',
        570,
        false,
        'Chicken Pepperoni',
        'A classic American taste! Relish the delectable flavor of Chicken Pepperoni, topped with extra cheese'

    ),
    Pizza(
        'images/Non-Veg-Supreme.jpg',
        570,
        false,
        'Non Veg Supreme',
        'Supreme combination of black olives, onion, capsicum, grilled mushroom, pepper barbecue chicken, peri-peri chicken & grilled chicken rashers'
    ),
  ];
}