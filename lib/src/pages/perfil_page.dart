import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:productos_app/src/models/products2.dart';
import 'package:productos_app/src/models/profile.dart';
import 'package:productos_app/src/pages/login_page.dart';
import 'package:productos_app/src/providers/perfil_form_provider.dart';
import 'package:productos_app/src/providers/providers.dart';
import 'package:productos_app/src/services/auth_service.dart';
import 'package:productos_app/src/services/perfil_service.dart';
import 'package:productos_app/src/services/product_service.dart';
import 'package:productos_app/src/ui/Input_decorations.dart';
import 'package:productos_app/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'loading_page.dart';

class PerfilPage extends StatelessWidget {
  final List<Profile> arr = [];
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<PerfilService>(context);
    final authservice = Provider.of<AuthService>(context, listen: false);
    if (productService.isLoading) return LoadingPage();

    for (int i = 0; i < productService.profiles.length; i++) {
      arr.add(productService.profiles[i]);

      print(arr[0].toJson());
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            authservice.logOut();
            Navigator.pushReplacementNamed(context, 'login');
          },
          child: Icon(
            Icons.login_outlined,
            color: Colors.red[300],
          ),
        ),
      ),
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /*    SizedBox(
                height: 100,
              ), */
              CardContainer(
                child: Column(
                  children: [
                    /*  FutureBuilder(
                        future: authservice.readToken(),
                        // initialData: InitialData,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          Map<String, dynamic> payload =
                              JwtDecoder.decode(snapshot.data);

                          print(payload["email"]);
                          for (int i = 0;
                              i < productService.profiles.length;
                              i++) {
                            if (payload["email"] ==
                                productService.profiles[i].email) print('Aca');
                            arr.add(productService.profiles[i]);

                            print(arr[0].toJson());
                          }
                          if (!snapshot.hasData) return Text('');

                          if (snapshot.data == '') {
                            Future.microtask(() {
                              print('f');
                            });
                          } else {}

                          return Container();
                        }), */
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Mi perfil',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ChangeNotifierProvider(
                        create: (_) => PerfilFormProvider(arr[0]),
                        child: _EditarProductoForm(
                            productService: productService)),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              /*  Text(
                'Crear una nueva cuenta',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ), */
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EditarProductoForm extends StatelessWidget {
  const _EditarProductoForm({
    Key? key,
    required this.productService,
  }) : super(key: key);
  final PerfilService productService;
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<PerfilService>(context);
    final productForm = Provider.of<PerfilFormProvider>(context);
    final product = productForm.product2;
    return Container(
      child: Form(
          key: productForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Stack(
                children: [
                  getImage(product.image),
                  Positioned(
                    top: 20,
                    right: 10,
                    child: IconButton(
                      onPressed: () async {
                        final picker = new ImagePicker();
                        final pickedFile = await picker.pickImage(
                          //source: ImageSource.gallery,
                          source: ImageSource.camera,
                          imageQuality: 100,
                        );
                        if (pickedFile == null) {
                          print('No se captura imagen');
                          return;
                        }
                        productService
                            .updateSelectedprofileImage(pickedFile.path);
                      },
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        size: 40,
                        color: Colors.blue[200],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              TextFormField(
                  autocorrect: false,
                  initialValue: product.name,
                  decoration: InputDecorations.authInputDecoration(
                      labelText: 'Nombre',
                      prefix: Icons.person_off,
                      hintText: 'Nombre del producto'),
                  onChanged: (value) => product.name = value,
                  validator: (value) {
                    if (value != null && value.length >= 5) return null;
                    return 'El Nombre debe tener minimo 5 caracteres';
                  }),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                  autocorrect: false,
                  initialValue: product.email,
                  decoration: InputDecorations.authInputDecoration(
                      labelText: 'Email',
                      prefix: Icons.person_off,
                      hintText: 'Descripcion del producto'),
                  onChanged: (value) => product.email = value,
                  validator: (value) {
                    if (value != null && value.length >= 5) return null;
                    return 'La Descripcion debe tener minimo 5 caracteres';
                  }),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                  autocorrect: false,
                  initialValue: '${product.phone}',
                  decoration: InputDecorations.authInputDecoration(
                      labelText: 'Telefono',
                      prefix: Icons.person_off,
                      hintText: 'Descripcion del Precio'),
                  onChanged: (value) => product.phone = value,
                  validator: (value) {
                    if (value != null && value.length >= 3) return null;
                    return 'El Precio debe tener minimo 3 caracteres';
                  }),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                  autocorrect: false,
                  initialValue: product.address,
                  decoration: InputDecorations.authInputDecoration(
                      labelText: 'Direccion',
                      prefix: Icons.person_off,
                      hintText: 'Capacidad'),
                  onChanged: (value) => product.address = value,
                  validator: (value) {
                    if (value != null && value.length >= 2) return null;
                    return 'La Capacidad debe tener minimo 2 caracteres';
                  }),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 30,
              ),
              FloatingActionButton(
                child: productService.isSaving
                    ? CircularProgressIndicator(color: Colors.white)
                    : Icon(Icons.save_outlined),
                onPressed: productService.isSaving
                    ? null
                    : () async {
                        if (!productForm.isValidForm()) return;
                        final String? imageUrl =
                            await productService.upladImage();
                        if (imageUrl != null)
                          productForm.product2.image = imageUrl;
                        await productService
                            .saveOrCreateprofile(productForm.product2);
                      },
              ),
            ],
          )),
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
}
