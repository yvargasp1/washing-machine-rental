
import 'package:flutter/material.dart';
import 'package:productos_app/src/pages/init_page.dart';
import 'package:productos_app/src/pages/pages.dart';
import 'package:productos_app/src/pages/register_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lavadoras App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'init_page',
      routes: {
        'login': ( _ ) => LoginPage(),
        'home':  ( _ ) => HomePage(),
        'register':  ( _ ) => RegisterPage(),
        'init_page':  ( _ ) => InitPage(),
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.indigo,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
          elevation: 0,
        )
      ),
    );
  }
}