import 'package:flutter/material.dart';
import 'package:productos_app/src/pages/login_page.dart';
import 'package:productos_app/src/providers/providers.dart';
import 'package:productos_app/src/ui/Input_decorations.dart';
import 'package:productos_app/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      'Registro',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ChangeNotifierProvider(
                        create: (_) => RegisterFormProvider(),
                        child: _RegisterForm()),
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

class _RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterFormProvider>(context);
    return Container(
      child: Form(
          key: registerForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Correo Electronico',
                    prefix: Icons.alternate_email,
                    hintText: 'correo@gmail.com'),
                onChanged: (value) => registerForm.email = value,
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = new RegExp(pattern);
                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'No es un correo valido';
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                  autocorrect: false,
                  obscureText: true,
                  decoration: InputDecorations.authInputDecoration(
                      labelText: 'Password',
                      prefix: Icons.lock_outline,
                      hintText: ''),
                  onChanged: (value) => registerForm.password = value,
                  validator: (value) {
                    if (value != null && value.length >= 8) return null;
                    return 'La contraseña debe tener minimo 8 caracteres';
                  }),
              SizedBox(
                height: 30,
              ),

              TextFormField(
                  autocorrect: false,
                  decoration: InputDecorations.authInputDecoration(
                      labelText: 'Telefono',
                      prefix: Icons.phone,
                      hintText: '312456879'),
                  onChanged: (value) => registerForm.phone = value,
                  validator: (value) {
                    if (value != null && value.length >= 7) return null;
                    return 'El telefono debe tener minimo 7 caracteres';
                  }),
              SizedBox(
                height: 30,
              ),
                TextFormField(
                  autocorrect: false,
                  decoration: InputDecorations.authInputDecoration(
                      labelText: 'Dirección',
                      prefix: Icons.apartment,
                      hintText: 'Cll 4 # 6-80'),
                  onChanged: (value) => registerForm.address = value,
                  validator: (value) {
                    if (value != null && value.length >= 7) return null;
                    return 'La dirección debe tener minimo 7 caracteres';
                  }),
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
                      'Registrarse',
                      style: TextStyle(color: Colors.white,
                       decorationStyle: TextDecorationStyle.wavy
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (registerForm.isValidForm()){
                      
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                    }

                  }),
            ],
          )),
    );
  }
}
