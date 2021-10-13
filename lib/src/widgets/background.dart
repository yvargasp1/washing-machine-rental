import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [Colors.white, Colors.white12],
        begin: Alignment.bottomCenter,
        end: Alignment.center,
      ).createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.jpeg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(1.0), BlendMode.colorBurn))),
        /*  child: new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 10.0,sigmaY: 10.0),
              child: new Container(
                //decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ), */
      ),
    );
  }
}
