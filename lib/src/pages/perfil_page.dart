import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:productos_app/src/models/clients.dart';
import 'package:productos_app/src/models/products.dart';
import 'package:productos_app/src/models/profile.dart';
import 'package:productos_app/src/pages/details_product_page.dart';
import 'package:productos_app/src/pages/register_page.dart';
import 'package:productos_app/src/pages/request_page.dart';
import 'package:productos_app/src/services/auth_service.dart';
import 'package:productos_app/src/services/perfil_service.dart';
import 'package:productos_app/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'package:jwt_decoder/jwt_decoder.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  bool isobscurepass = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final profileService = Provider.of<PerfilService>(context);
    final authservice = Provider.of<AuthService>(context, listen: false);

    List<Profile> arr = [];

    return Stack(
      children: [
        FutureBuilder(
            future: authservice.readToken(),
            // initialData: InitialData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              Map<String, dynamic> payload = JwtDecoder.decode(snapshot.data);

              print(payload["email"]);
              for (int i = 0; i < profileService.profiles.length; i++) {
                if (payload["email"] == profileService.profiles[i].email)
                  arr.add(profileService.profiles[i]);
              }
              return Scaffold(
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
                          getImage(arr[0].image),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(width: 4, color: Colors.white),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          children: [
                            buildTextField("Nombre", arr[0].name, false),
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 80,
                        margin: const EdgeInsets.all(15.0),
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          children: [
                            buildTextField("Telefono", arr[0].phone, false),
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 80,
                        margin: const EdgeInsets.all(15.0),
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          children: [
                            buildTextField("Dirección", arr[0].address, false),
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 80,
                        margin: const EdgeInsets.all(15.0),
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          children: [
                            buildTextField(
                                "Contraseña", clients[0].password, true),
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 80,
                      margin: const EdgeInsets.all(15.0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                      child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          disabledColor: Colors.grey,
                          elevation: 0,
                          color: Colors.green,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            child: Text(
                              "Actualizar",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          onPressed: () {}),
                    ),
                  ],
                ),
              );
            }),
      ],
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
