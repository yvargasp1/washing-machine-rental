import 'package:flutter/material.dart';
import 'package:productos_app/src/models/products.dart';
import 'package:productos_app/src/models/requests.dart';

class ItemCardRequest extends StatelessWidget {
  final Request? request;
  final VoidCallback? press;
  const ItemCardRequest({
    Key? key,
    this.request,
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
                      request!.producto,
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
                          request!.image,
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
                  color: request!.color,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Text(
                      request!.title,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
