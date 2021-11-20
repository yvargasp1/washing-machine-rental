import 'package:flutter/material.dart';
import 'package:productos_app/src/pages/home_page.dart';
import 'package:productos_app/src/pages/init_page.dart';
import 'package:productos_app/src/pages/login_page.dart';
import 'package:productos_app/src/services/auth_service.dart';
import 'package:productos_app/src/widgets/bottom_bar.dart';
import 'package:provider/provider.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authservice = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: authservice.readToken(),
            // initialData: InitialData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) return Text('');
              if (snapshot.data == '') {
                Future.microtask(() {
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => InitPage(),
                          transitionDuration: (Duration(seconds: 0))));
                });
              } else {
                Future.microtask(() {
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => BottomBar(),
                          transitionDuration: (Duration(seconds: 0))));
                });
              }
              return Container();
            }),
      ),
    );
  }
}
