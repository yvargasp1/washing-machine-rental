import 'package:flutter/material.dart';
import 'package:productos_app/src/pages/search_page.dart';

class CounterHours extends StatefulWidget {
  @override
  _CounterHoursState createState() => _CounterHoursState();
}

class _CounterHoursState extends State<CounterHours> {
  int numofitems = 1;
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SearchPage()));
          }),
    ]);
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
