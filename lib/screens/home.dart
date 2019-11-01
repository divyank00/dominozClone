import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pizza_delivery/code/pizza.dart';
import 'package:pizza_delivery/screens/customize.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
        appBar: AppBar(
          title: Text('Explore'),
          backgroundColor: Colors.blue.shade800,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(5.0),
            child: ListView.builder(
              itemBuilder: (context,position){
                return cardBuild(context,getData().elementAt(position),position);
              },
              itemCount: getData().length,
            ),
          ),
        ));
  }

  Widget cardBuild(BuildContext context,Pizza pizza,int position){
    return Card(
      elevation: 5,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context){
              return Customize(getData().elementAt(position));
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
                              backgroundColor: Colors.transparent.withOpacity(0.05),
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
                                        builder: (context){
                                      return Customize(getData().elementAt(position));
                                    }));},
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

  List getData(){
    return[
      Pizza(
        'images/margherita.jpg',
        199,
        'Margherita',
        'Classic delight with 100% real mozzarella cheese'
      ),
      Pizza(
          'images/cheese_and_corn.png',
          305,
          'Cheese n Corn',
          'A delectable combination of sweet & juicy golden corn'
      ),
      Pizza(
          'images/cheese_and_tomato.png',
          305,
          'Cheese n Tomato',
          'A delectable combination of cheese and juicy tomato'
      ),
      Pizza(
          'images/farmhouse.png',
          395,
          'Farmhouse',
          'Delightful combination of onion, capsicum, tomato & grilled mushroom'
      ),Pizza(
          'images/peppypaneer.png',
          395,
          'Peppy Paneer',
          'Flavorful trio of juicy paneer, crisp capsicum with spicy red paprika'
      ),
    ];
  }
}
