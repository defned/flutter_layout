import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:fluttery/framing.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: "Title"),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  // The images are saved with names pic1.jpg, pic2.jpg...pic30.jpg.
// The List.generate constructor allows an easy way to create
// a list when objects have a predictable naming pattern.
  List<Container> _buildGridTileList(int count) {

    return new List<Container>.generate(
        count,
            (int index) =>
                  new Container(
                      width: 150.0,
                      height: 150.0,
                      child: new Card(color: RandomColor.next(), child: new Stack(children: <Widget>[
                      new Positioned.fill(
                      bottom: 0.0,
                        child: new GridTile(
                            header: new GridTileBar(
                              title: new Text("title"),
                              backgroundColor: Colors.black45,
                              /*subtitle: new Text("subtitle"),*/
                              trailing: new Icon(
                                Icons.star_border,
                                color: Colors.white,
                              ),
                            ),
                            child: new Image(image: new NetworkImageWithRetry("https://github.com/realm/realm-cocoa/issues/5473"), fit: BoxFit.cover)),
                      ),
                        new Positioned.fill(
                            child: new Material(
                                color: Colors.transparent,
                                child: new InkWell(
                                  splashColor: Colors.lightGreenAccent,
                                  //onTap: () => _launchStream(s.displayName),
                                )))])))
            );
  }

  Widget buildGrid() {
    return new GridView.extent(
        maxCrossAxisExtent: 300.0,
        padding: const EdgeInsets.all(2.0),
        mainAxisSpacing: 2.0,
        crossAxisSpacing: 2.0,
        children: _buildGridTileList(30));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: buildGrid(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
