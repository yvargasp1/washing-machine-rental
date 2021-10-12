import 'package:flutter/material.dart';
import 'package:productos_app/src/models/products.dart';
import 'package:productos_app/src/pages/register_page.dart';
import 'package:productos_app/src/pages/search_page.dart';
import 'package:productos_app/src/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
      backgroundColor: Colors.transparent,
      appBar: buildAppBar(context),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 100,
            child: Center(
              child: Text(
                'Modelos',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    decorationStyle: TextDecorationStyle.wavy),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
              height: 180,
              width: 160,
              decoration: BoxDecoration(
                  color: products[0].color,
                  borderRadius: BorderRadius.circular(16)),
              child: Image(image: AssetImage(products[0].image)))
        ],
      )),
    ),
      ],
    );

    
  }

  AppBar buildAppBar(context) {
    return AppBar(
      backgroundColor: Colors.blue[100],
      leading: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegisterPage()));
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.search,
              size: 26.0,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.history,
              size: 26.0,
            ),
          ),
        )
      ],
    );
  }
}
