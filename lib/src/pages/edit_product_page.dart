import 'package:flutter/material.dart';
import 'package:productos_app/src/models/products2.dart';
import 'package:productos_app/src/pages/login_page.dart';
import 'package:productos_app/src/providers/providers.dart';
import 'package:productos_app/src/services/product_service.dart';
import 'package:productos_app/src/ui/Input_decorations.dart';
import 'package:productos_app/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class EditProductPage extends StatelessWidget {
  final Product2? product;

  EditProductPage({Key? key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              CardContainer(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Editar producto',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ChangeNotifierProvider(
                        create: (_) => ProductFormProvider(product!),
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
  final ProductService productService;
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product2;
    return Container(
      child: Form(
          key: productForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              product.image == null
                  ? Image(
                      image: AssetImage('assets/no-image.png'),
                      fit: BoxFit.cover,
                    )
                  : FadeInImage(
                      placeholder: AssetImage('assets/jar-loading.gif'),
                      image: NetworkImage(product.image!),
                      fit: BoxFit.cover,
                    ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                  autocorrect: false,
                  initialValue: product.title,
                  decoration: InputDecorations.authInputDecoration(
                      labelText: 'Nombre',
                      prefix: Icons.person_off,
                      hintText: 'Nombre del producto'),
                  onChanged: (value) => product.title = value,
                  validator: (value) {
                    if (value != null && value.length >= 5) return null;
                    return 'El Nombre debe tener minimo 5 caracteres';
                  }),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                  autocorrect: false,
                  initialValue: product.description,
                  decoration: InputDecorations.authInputDecoration(
                      labelText: 'Descripcion',
                      prefix: Icons.person_off,
                      hintText: 'Descripcion del producto'),
                  onChanged: (value) => product.description = value,
                  validator: (value) {
                    if (value != null && value.length >= 5) return null;
                    return 'La Descripcion debe tener minimo 5 caracteres';
                  }),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                  autocorrect: false,
                  initialValue: '${product.price}',
                  decoration: InputDecorations.authInputDecoration(
                      labelText: 'Precio',
                      prefix: Icons.person_off,
                      hintText: 'Descripcion del Precio'),
                  onChanged: (value) => product.price = value,
                  validator: (value) {
                    if (value != null && value.length >= 3) return null;
                    return 'El Precio debe tener minimo 3 caracteres';
                  }),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                  autocorrect: false,
                  initialValue: product.size,
                  decoration: InputDecorations.authInputDecoration(
                      labelText: 'Capacidad',
                      prefix: Icons.person_off,
                      hintText: 'Capacidad'),
                  onChanged: (value) => product.size = value,
                  validator: (value) {
                    if (value != null && value.length >= 2) return null;
                    return 'La Capacidad debe tener minimo 2 caracteres';
                  }),
              SizedBox(
                height: 30,
              ),
              SwitchListTile.adaptive(
                value: product.available,
                title: Text('Disponible'),
                activeColor: Colors.indigo,
                onChanged: productForm.updateAvailability,
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: Colors.black,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    child: Text(
                      'Actualizar',
                      style: TextStyle(
                          color: Colors.white,
                          decorationStyle: TextDecorationStyle.wavy),
                    ),
                  ),
                  onPressed: () async {
                    if (!productForm.isValidForm()) return;
                    await productService
                        .saveOrCreateProduct(productForm.product2);
                  }),
            ],
          )),
    );
  }
}
