import 'package:flutter/material.dart';
import 'package:productos_app/src/models/products.dart';
import 'package:productos_app/src/pages/details_product_page.dart';
import 'package:productos_app/src/pages/register_page.dart';
import 'package:productos_app/src/pages/search_page.dart';
import 'package:productos_app/src/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.blue[200],
          appBar: buildAppBar(context),
          body: SafeArea(
              child: Column(
            children: [
              Container(
                height: 20,
                child: Center(
                  child: Text(
                    '',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decorationStyle: TextDecorationStyle.wavy),
                  ),
                ),
              ),
              SizedBox(
                height: 7.2,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 5.0),
                  child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, childAspectRatio: 0.8),
                    itemBuilder: (context, index) => ItemCard(
                      product: products[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsProduct(
                                    product: products[index],
                                  ))),
                    ),
                  ),
                ),
              )
            ],
          )),
        ),
      ],
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Modelos',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.blue[200], fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      /* leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ), */
      /*   actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.search,
              color: Colors.black,
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
              color: Colors.black,
              size: 26.0,
            ),
          ),
        )
      ], */
    );
  }
}
