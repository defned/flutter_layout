import 'dart:math';
import 'package:eflyr/ui/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:fluttery/framing.dart';
import 'package:flutter/foundation.dart';

const _bluePrimaryValue = 0xFF024EFD;

const MaterialColor black = const MaterialColor(
  _bluePrimaryValue,
  const <int, Color>{
    50:  const Color(0xFFe0e0e0),
    100: const Color(0xFFb3b3b3),
    200: const Color(0xFF808080),
    300: const Color(0xFF4d4d4d),
    400: const Color(0xFF262626),
    500: const Color(_bluePrimaryValue),
    600: const Color(0xFF000000),
    700: const Color(0xFF000000),
    800: const Color(0xFF000000),
    900: const Color(0xFF000000),
  },
);

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
        primarySwatch: black,
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
  SearchBar searchBar;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        title: new Text('eFLYRs'),
        actions: [searchBar.getSearchAction(context)]);
  }

  void onSubmitted(String value) {
    setState(() => _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text('You wrote $value!'))));
  }

  _MyHomePageState() {
    searchBar = new SearchBar(
        inBar: false,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        onSubmitted: onSubmitted);
  }

  // The images are saved with names pic1.jpg, pic2.jpg...pic30.jpg.
// The List.generate constructor allows an easy way to create
// a list when objects have a predictable naming pattern.
  List<Container> _buildGridTileList(int count) {
    return new List<Container>.generate(
        count,
        (int index) => new Container(
            width: 150.0,
            height: 150.0,
            child: new Card(
                color: RandomColor.next(),
                child: new Stack(children: <Widget>[
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
                        child: new Image(
                            image: new NetworkImageWithRetry(
                                "https://robohash.org/${new Random().nextInt(254) + 1}.${new Random().nextInt(254) + 1}.${new Random().nextInt(254) + 1}.${new Random().nextInt(254) + 1}.png?set=set2"),
                            fit: BoxFit.cover)),
                  ),
                  new Positioned.fill(
                      child: new Material(
                          color: Colors.transparent,
                          child: new InkWell(
                            splashColor: Colors.lightGreenAccent,
                            //onTap: () => _launchStream(s.displayName),
                          )))
                ]))));
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
      appBar: searchBar.build(context),
      key: _scaffoldKey,
      drawer: new Drawer(
          child: new ListView(
              padding: const EdgeInsets.only(top: 0.0),
              children: _buildDrawerList(context))),
      body: buildGrid(),
      floatingActionButton: new FloatingActionButton(
        //onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Widget> _buildDrawerList(BuildContext context) {
    List<Widget> children = [];
    children
      ..addAll(_buildHeader(context))
      /*
      ..addAll(_buildUserAccounts(context))
      ..addAll(_defaultLabels(context))
      ..addAll([new Divider()])
      ..addAll(_buildLabelWidgets(context))
      ..addAll([new Divider()])
      ..addAll(_buildActions(context))
      ..addAll([new Divider()])
    */
      ..addAll(_buildSettingAndHelp(context));

    return children;
  }

  List<Widget> _buildHeader(BuildContext context) {
    return [
      new DrawerHeader(decoration: new BoxDecoration(color: new Color(_bluePrimaryValue)), child: new ListTile(
          leading: new Icon(Icons.input, color: Colors.white),
          title: new Text("Sign in",
              style: new TextStyle(
                  fontSize: 17.0, color: Colors.white)))),
      /*
      new Container(
          height: 150.0,
          color: Colors.blue,
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.input, color: Colors.white),
                    title: new Text("Sign in",
                        style: new TextStyle(
                            fontSize: 17.0, color: Colors.white))),
              ])),*/
    ];
  }

  List<Widget> _buildSettingAndHelp(BuildContext context) {
    String settings = 'Settings';
    String helpAndFeedBack = 'Help & feedback';
    String about = 'About';
    String signOut = 'Sign out';
    if(true) {
      return [
        new ListTile(
          leading: new Icon(Icons.help),
          title: new Text(helpAndFeedBack),
          //onTap: () => _onListTileTap(context, helpAndFeedBack),
        ),
        new ListTile(
          leading: new Icon(Icons.info),
          title: new Text(about),
          //onTap: () => _onListTileTap(context, helpAndFeedBack),
        )
      ];
    } else {
      return [
        new ListTile(
          leading: new Icon(Icons.settings),
          title: new Text(settings),
          //onTap: () => _onListTileTap(context, settings),
        ),
        new ListTile(
          leading: new Icon(Icons.exit_to_app),
          title: new Text(signOut),
          //onTap: () => _onListTileTap(context, signOut),
        ),
        new ListTile(
          leading: new Icon(Icons.help),
          title: new Text(helpAndFeedBack),
          //onTap: () => _onListTileTap(context, helpAndFeedBack),
        )
      ];
    }
  }
}
