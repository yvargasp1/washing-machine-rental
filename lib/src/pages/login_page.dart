import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:productos_app/src/pages/register_page.dart';
import 'package:productos_app/src/providers/providers.dart';
import 'package:productos_app/src/ui/Input_decorations.dart';
import 'package:productos_app/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
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
                      'Ingreso',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ChangeNotifierProvider(
                        create: (_) => LoginFormProvider(),
                        child: _LoginForm()),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              new RichText(
                text: new TextSpan(children: [
                  new TextSpan(
                    text: 'Crea una nueva cuenta.',
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                  ),
                ]),
              ),
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

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
          key: loginForm.formKey,
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
                onChanged: (value) => loginForm.email = value,
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
                  onChanged: (value) => loginForm.password = value,
                  validator: (value) {
                    if (value != null && value.length >= 8) return null;
                    return 'La contraseña debe tener minimo 8 caracteres';
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
                      'Ingresar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    if (loginForm.isValidForm()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BottomBar()));
                    }
                  }),
            ],
          )),
    );
  }
}
