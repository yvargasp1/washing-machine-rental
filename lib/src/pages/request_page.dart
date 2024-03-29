import 'package:flutter/material.dart';
import 'package:productos_app/src/models/clients.dart';
import 'package:productos_app/src/models/products.dart';
import 'package:productos_app/src/models/requests.dart';
import 'package:productos_app/src/pages/details_product_page.dart';
import 'package:productos_app/src/pages/home_page.dart';
import 'package:productos_app/src/pages/register_page.dart';
import 'package:productos_app/src/pages/request_page.dart';
import 'package:productos_app/src/services/request_service.dart';
import 'package:productos_app/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'loading_page.dart';

class RequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final productService = Provider.of<RequestService>(context);
    if (productService.isLoading) return LoadingPage();
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.blue[200],
          appBar: buildAppBar(context),
          body: SafeArea(
              child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: 250,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 2.0, vertical: 6.0),
                  child: GridView.builder(
                       itemCount: productService.request.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, childAspectRatio: 2.0),
                    itemBuilder: (context, index) =>
                        ItemCardRequest(request: productService.request[index], press: () {}),
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
        'Solicitudes',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.blue[200], fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      /* leading: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
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
