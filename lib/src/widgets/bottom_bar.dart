import 'package:flutter/material.dart';
import 'package:productos_app/src/models/products2.dart';
import 'package:productos_app/src/pages/home_page.dart';
import 'package:productos_app/src/pages/perfil_page.dart';
import 'package:productos_app/src/pages/request_page.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late final Product2 product2;
  int _currentIndex = 0;
  List<Widget> _pages = [HomePage(), RequestPage(), PerfilPage()];
  void onTappedBar(int i) {
    setState(() {
      _currentIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue[200],
        unselectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.note_alt), label: "Solicitudes"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil")
        ],
      ),
    );
  }
}
