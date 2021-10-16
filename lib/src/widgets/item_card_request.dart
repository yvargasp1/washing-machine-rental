import 'package:flutter/material.dart';
import 'package:productos_app/src/models/clients.dart';
import 'package:productos_app/src/models/products.dart';
import 'package:productos_app/src/models/requests.dart';

class ItemCardRequest extends StatefulWidget {
  final Request? request;
  final VoidCallback? press;
  const ItemCardRequest({
    Key? key,
    this.request,
    this.press,
  }) : super(key: key);

  @override
  _ItemCardRequestState createState() => _ItemCardRequestState();
}

class _ItemCardRequestState extends State<ItemCardRequest> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.press,
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
                      widget.request!.producto,
                      style: TextStyle(
                          color: Colors.white,
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
                        child: Image(
                            image: AssetImage(
                          widget.request!.image,
                        ))),
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
                  color: widget.request!.color,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Text(
                      widget.request!.title,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () => _showAlert(context)),
            ),
          ],
        ),
      ),
    );
  }
}

void _showAlert(BuildContext context) {
  /*   ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      ); */

  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Solicitud'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('Nombre: \ ${clients[0].name},'),
              ),
              ListTile(
                title: Text('Telefono: \ ${clients[0].phone},'),
              ),
              ListTile(
                title: Text('Direccion: \ ${clients[0].address},'),
              ),
              ListTile(),
              ListTile(),
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
