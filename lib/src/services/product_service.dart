import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:productos_app/src/models/products2.dart';
import 'package:flutter/foundation.dart';

class ProductService extends ChangeNotifier {
  final String _baseUrl = 'productos-app-ef283-default-rtdb.firebaseio.com';
  final List<Product2> products = [];
  late Product2 productSelected;
  bool isLoading = true;
  bool isSaving = false;

  ProductService() {
    this.loadProducts();
  }

  Future<List<Product2>> loadProducts() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'products.json');
    final respuesta = await http.get(url);
    final Map<String, dynamic> productsMap = json.decode(respuesta.body);
    debugPrint('products: $productsMap');
    productsMap.forEach((key, value) {
      final productTemp = Product2.fromMap(value);
      productTemp.id = key;
      this.products.add(productTemp);
    });
    isLoading = false;
    notifyListeners();
    return products;
  }

  Future saveOrCreateProduct(Product2 product) async {
    isSaving = true;
    notifyListeners();
    if (product.id != null) {
      await this.updateProduct(product);
    } else {
      await this.createProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product2 product) async {
    final url = Uri.https(_baseUrl, 'products/${product.id}.json');
    final respuesta = await http.put(url, body: product.toJson());
    final decoData = respuesta.body;
    print(decoData);
    final index =
        this.products.indexWhere((element) => element.id == product.id);
    this.products[index] = product;
    return product.id!;
  }

  Future<String> createProduct(Product2 product) async {
    final url = Uri.https(_baseUrl, 'products.json');
    final respuesta = await http.post(url, body: product.toJson());
    final decoData = json.decode(respuesta.body);
    print(decoData);
    product.id = decoData['name'];
    this.products.add(product);
    return product.id!;
  }
}
