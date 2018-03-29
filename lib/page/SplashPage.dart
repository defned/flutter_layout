import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:eflyr/settings.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Settings.colors.blue,
        body: new Center(
            child: new Stack(
          children: [
            new Transform.rotate(
                angle: -0.1,
                child: new Text(
                  "eFLYR",
                  style: new TextStyle(
                      color: Colors.yellowAccent.shade400,
                      fontFamily: 'Lazer84',
                      fontSize: 40.0),
                )),
            new BackdropFilter(
                filter: new ui.ImageFilter.matrix(
                    new Matrix4.translationValues(5.0, 4.0, 5.0).storage),
                child: new Transform.rotate(
                  angle: -0.1,
                  child: new Text("eFLYR",
                      style: new TextStyle(
                          color: Colors.pink,
                          fontFamily: 'Lazer84',
                          fontSize: 40.0)),
                )),
          ],
        )));
  }

  @override
  void initState() {
    super.initState();
    new Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'home');
    });
  }
}
