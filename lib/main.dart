import 'package:flutter/material.dart';
import 'package:productos_app/src/pages/check_oauth_page.dart';
import 'package:productos_app/src/pages/init_page.dart';
import 'package:productos_app/src/pages/pages.dart';
import 'package:productos_app/src/pages/register_page.dart';
import 'package:productos_app/src/services/perfil_service.dart';
import 'package:productos_app/src/services/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthService(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductService(),
        ),
        ChangeNotifierProvider(
          create: (_) => PerfilService(),
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lavadoras App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'checking',
      routes: {
        'login': (_) => LoginPage(),
        'home': (_) => HomePage(),
        'register': (_) => RegisterPage(),
        'init_page': (_) => InitPage(),
        'checking': (_) => CheckOutPage()
      },
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.blue[200],
          appBarTheme: AppBarTheme(
            elevation: 0,
            color: Colors.indigo,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.indigo,
            elevation: 0,
          )),
    );
  }
}
