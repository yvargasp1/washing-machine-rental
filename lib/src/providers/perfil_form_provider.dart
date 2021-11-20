import 'package:flutter/material.dart';
import 'package:productos_app/src/models/profile.dart';

class PerfilFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Profile product2;

  PerfilFormProvider(this.product2);
  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
