import 'package:flutter/material.dart';
import 'package:productos_app/src/models/clients.dart';
import 'package:productos_app/src/models/products.dart';

class EditProductPage extends StatefulWidget {
  @override
  _EditProductPage createState() => _EditProductPage();
}

class _EditProductPage extends State<EditProductPage> {
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
                              image: AssetImage(products[0].image))),
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
                      buildTextField("Nombre", products[0].title, false),
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
                      buildTextField(
                          "Descripcion", products[0].description, false),
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
                      buildTextField(
                          "Valor estimado / hora", products[0].price, false),
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
                      buildTextField(
                          "Cantidad de prendas", products[0].size, true),
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
                    onPressed: () {
                      Navigator.pop(context);
                    }),
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
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      title: Text(
        'Producto',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.blue[200], fontWeight: FontWeight.bold),
      ),

      /* actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 26.0,
            ),
          ),
        ),
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
                      Icons.article,
                      color: Colors.blue,
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
