import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:eflyr/page/FlyerOverviewPage.dart';
import 'package:eflyr/page/AboutPage.dart';
import 'package:eflyr/page/SplashPage.dart';


import 'settings.dart';

void main() {
  // Create the router.
  Router router = new Router();

  // Define our splash page.
  router.define('splash', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new SplashPage();
  }));

  // Define our home page.
  router.define('home', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new FlyerOverviewPage();
  }));

  // Define our about page.
  router.define('about', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new AboutPage();
  }));

  runApp(new MaterialApp(
      title: 'eFLYR',
      theme: new ThemeData(
        primarySwatch: Settings.colors.blue,
      ),
      home: new SplashPage(),
      onGenerateRoute: router.generator // Use our Fluro routers for this app.
  ));

  //runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
        theme: new ThemeData(
        primarySwatch: Settings.colors.blue,
        ),
      home: new FlyerOverviewPage(title: "Title"),
    );
  }
}
