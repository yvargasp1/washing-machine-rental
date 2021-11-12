import 'package:flutter/material.dart';
import 'package:productos_app/src/models/products2.dart';
import 'package:productos_app/src/pages/request_page.dart';
import 'package:productos_app/src/providers/providers.dart';
import 'package:provider/provider.dart';

class CounterHours extends StatefulWidget {
  const CounterHours({Key? key, this.product}) : super(key: key);

  @override
  _CounterHoursState createState() => _CounterHoursState();

  final Product2? product;
}

class _CounterHoursState extends State<CounterHours> {
  int numofitems = 1;
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      buildOutlinedButton(
          icon: Icons.remove,
          press: () {
            setState(() {
              if (numofitems > 0) numofitems--;
            });
          }),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          numofitems.toString().padLeft(2, "0"),
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            buildOutlinedButton(
                icon: Icons.add,
                press: () {
                  setState(() {
                    numofitems++;
                  });
                }),
          ])),
      MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          disabledColor: Colors.grey,
          elevation: 0,
          color: Colors.green,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            child: Text(
              'Solicitar',
              style: TextStyle(color: Colors.white),
            ),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RequestPage()));
          }),
      Expanded(
        child: SwitchListTile.adaptive(
            value: widget.product!.available,
            title: Text(''),
            activeColor: Colors.indigo,
            onChanged: (bool value) {
              setState(() {
                _onSwitchChanged(value);
              });
            }),
      ),
    ]);
  }

  void _onSwitchChanged(bool value) {
    setState(() {
      isSwitched = value;
    });
  }

  SizedBox buildOutlinedButton(
      {required IconData icon, required VoidCallback press}) {
    return SizedBox(
        width: 55,
        height: 35,
        child: OutlinedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
                side: MaterialStateProperty.all(BorderSide(
                    color: Colors.green,
                    width: 2.0,
                    style: BorderStyle.solid))),
            onPressed: press,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: Icon(
                      icon,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            )));
  }
}
