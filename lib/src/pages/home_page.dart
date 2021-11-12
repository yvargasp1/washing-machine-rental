import 'package:flutter/material.dart';
import 'package:productos_app/src/models/products2.dart';
import 'package:productos_app/src/pages/details_product_page.dart';
import 'package:productos_app/src/pages/edit_product_page.dart';
import 'package:productos_app/src/pages/loading_page.dart';
import 'package:productos_app/src/pages/register_page.dart';
import 'package:productos_app/src/pages/request_page.dart';
import 'package:productos_app/src/services/services.dart';
import 'package:productos_app/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    if (productService.isLoading) return LoadingPage();

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
                    itemCount: productService.products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, childAspectRatio: 0.79),
                    itemBuilder: (context, index) => ItemCard(
                      product: productService.products[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsProduct(
                                    product: productService.products[index],
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
    final productService = Provider.of<ProductService>(context);
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
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {
              productService.productSelected = new Product2(
                  available: false,
                  description: '',
                  price: '',
                  size: '',
                  title: '');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditProductPage(
                          product: productService.productSelected)));
            },
            child: Icon(
              Icons.add,
              color: Colors.black,
              size: 26.0,
            ),
          ),
        ),
      ],
    );
  }
}
