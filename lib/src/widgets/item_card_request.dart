import 'dart:io';

import 'package:flutter/material.dart';
import 'package:productos_app/src/models/clients.dart';
import 'package:productos_app/src/models/products.dart';
import 'package:productos_app/src/models/request2.dart';
import 'package:productos_app/src/models/requests.dart';

class ItemCardRequest extends StatelessWidget {
  final Request2 request;
  final VoidCallback? press;
  const ItemCardRequest({
    Key? key,
    required this.request,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  right: 50,
                ),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      request.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 20,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: getImage(request.image),
                    ),
                  ),
                ]),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                right: 50,
              ),
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: Colors.green,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Text(
                      request.description,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () => _showAlert(context, request)),
            ),
          ],
        ),
      ),
    );
  }

  Widget getImage(String? image) {
    if (image == null) {
      return Image(image: AssetImage('assets/no-image.png'), fit: BoxFit.cover);
    }
    if (image.startsWith('http')) {
      return FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(image),
          fit: BoxFit.cover);
    }

    return Image.file(
      File(image),
      fit: BoxFit.cover,
    );
  }

  void _showAlert(BuildContext context, Request2 request) {
    /*   ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      ); */

    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('Solicitud'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text('Nombre: \ ${request.client},'),
                ),
                ListTile(
                  title: Text('Telefono: \ ${request.phone},'),
                ),
                ListTile(
                  title: Text('Direccion: \ ${request.address},'),
                ),
                 ListTile(
                  title: Text('Hora: \ ${request.hour},'),
                ),
            
                Icon(
                  Icons.thumb_up_alt_outlined,
                  size: 100.0,
                  color: Colors.green,
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancelar'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }
}
