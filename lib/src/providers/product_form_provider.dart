import 'package:flutter/material.dart';
import 'package:productos_app/src/models/products2.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Product2 product2;

  ProductFormProvider(this.product2);
  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  updateAvailability(bool value) {
    this.product2.available = true;
    notifyListeners();
  }
}
