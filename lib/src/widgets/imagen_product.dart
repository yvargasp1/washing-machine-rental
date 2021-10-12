import 'package:flutter/material.dart';

class ImagenProduct extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10,top: 20),
      child: Container(
        decoration: _buildBoxDecoration(),
        width: double.infinity,
        height: 450,
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          child: FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://via.placeholder.com/400x300/green'),
            fit: BoxFit.cover
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration(){
    return BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45) ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: Offset(0,5)
        )
      ]
    );
  }
}