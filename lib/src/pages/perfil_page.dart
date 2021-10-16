import 'package:flutter/material.dart';
import 'package:productos_app/src/models/clients.dart';
import 'package:productos_app/src/models/products.dart';
import 'package:productos_app/src/pages/details_product_page.dart';
import 'package:productos_app/src/pages/register_page.dart';
import 'package:productos_app/src/pages/request_page.dart';
import 'package:productos_app/src/widgets/widgets.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  bool isobscurepass = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.blue[200],
          appBar: buildAppBar(context),
          body: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(.1))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(clients[0].image))),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 4, color: Colors.white),
                            color: Colors.blue),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 80,
                  margin: const EdgeInsets.all(15.0),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    children: [
                      buildTextField("Nombre", clients[0].name, false),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 80,
                  margin: const EdgeInsets.all(15.0),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    children: [
                      buildTextField("Telefono", clients[0].phone, false),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 80,
                  margin: const EdgeInsets.all(15.0),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    children: [
                      buildTextField("Dirección", clients[0].address, false),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 80,
                  margin: const EdgeInsets.all(15.0),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    children: [
                      buildTextField("Contraseña", clients[0].password, true),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 80,
                margin: const EdgeInsets.all(15.0),
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    disabledColor: Colors.grey,
                    elevation: 0,
                    color: Colors.green,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      child: Text(
                        "Actualizar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onPressed: () {}),
              ),
            ],
          ),
        )
      ],
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        'Perfil',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.blue[200], fontWeight: FontWeight.bold),
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
      ),
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

  Widget buildTextField(String labeltext, String placeholder, bool ispass) {
    FocusNode fnode = new FocusNode();
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        focusNode: fnode,
        obscureText: ispass ? isobscurepass : false,
        decoration: InputDecoration(
            suffixIcon: ispass
                ? IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ))
                : IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.article,
                      color: Colors.blue,
                    )),
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labeltext,
            labelStyle:
                TextStyle(color: fnode.hasFocus ? Colors.white : Colors.blue),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
    );
  }
}
