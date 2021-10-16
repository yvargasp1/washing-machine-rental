import 'package:flutter/material.dart';
import 'package:productos_app/src/pages/login_page.dart';
import 'package:productos_app/src/pages/register_page.dart';
import 'package:productos_app/src/widgets/widgets.dart';

class InitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 100,
                  child: Center(
                    child: Text(
                      'wmachine bog',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          //decoration: TextDecoration.underline,
                          //decorationColor: Colors.green,
                          decorationStyle: TextDecorationStyle.wavy),
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                ),
                MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    disabledColor: Colors.grey,
                    elevation: 0,
                    color: Colors.blue[200],
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 90, vertical: 15),
                      child: Text(
                        'Ingresar',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            decorationStyle: TextDecorationStyle.wavy),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    }),
                SizedBox(
                  height: 50,
                ),
                MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    disabledColor: Colors.grey,
                    elevation: 0,
                    color: Colors.white,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      child: Text(
                        'Registrarse',
                        style: TextStyle(
                            color: Colors.blue[200],
                            decorationStyle: TextDecorationStyle.wavy),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
