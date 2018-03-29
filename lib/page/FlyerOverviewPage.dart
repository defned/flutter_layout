import 'dart:math';
import 'package:eflyr/generated/queries.graphql.dart';
import 'package:eflyr/graphql/fetch.dart';
import 'package:eflyr/page/FlyerDetailsPage.dart';
import 'package:eflyr/widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:fluttery/framing.dart';
import 'package:flutter/foundation.dart';
import '../util/fetch.dart';
import '../settings.dart';

class FlyerOverviewPage extends StatefulWidget {
  FlyerOverviewPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FlyerOverviewState createState() => new _FlyerOverviewState();
}

class _FlyerOverviewState extends State<FlyerOverviewPage> {
  SearchBar searchBar;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _FlyerOverviewState() {
    searchBar = new SearchBar(
        inBar: false,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        onSubmitted: onSubmitted);
  }

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        title: new Text("eFLYRs"),
        actions: [searchBar.getSearchAction(context), getMapAction(context)]);
  }

  IconButton getMapAction(BuildContext context) {
    return new IconButton(icon: new Icon(Icons.map), onPressed: () {});
  }

  void onSubmitted(String value) {
    setState(() => _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text('You wrote $value!'))));
  }

  /// Build UI
  Widget buildGrid() {
    return new FutureBuilder(
        future: fetchFlyers(),
        builder: (BuildContext context,
            AsyncSnapshot<GraphqlResponse<GetFlyertemplatesResult>> snapshot) {
          if (!snapshot.hasData)
            // Shows progress indicator until the data is load.
            return new MaterialApp(
                home: new Scaffold(
              body: new Center(
                child: new CircularProgressIndicator(),
              ),
            ));
          // Shows the real data with the data retrieved.
          GraphqlResponse<GetFlyertemplatesResult> flyers = snapshot.data;
          return new CustomScrollView(
            primary: false,
            slivers: <Widget>[
              new SliverPadding(
                padding: const EdgeInsets.all(10.0),
                sliver: new SliverGrid.count(
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  crossAxisCount: 2,
                  children: createMovieCardItem(flyers, context),
                ),
              ),
            ],
          );
        });
  }

  List<Widget> createMovieCardItem(
      GraphqlResponse<GetFlyertemplatesResult> flyers, BuildContext context) {
    // Children list for the list.
    List<Widget> listElementWidgetList = new List<Widget>();
    if (flyers != null) {
      for (var edge in flyers.data.flyertemplates.edges) {
        listElementWidgetList.add(new Card(
            color: RandomColor.next(),
            child: new Stack(children: <Widget>[
              new Positioned.fill(
                  bottom: 0.0,
                  child: new GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(new FadeRoute(
                            builder: (BuildContext context) =>
                                new FlyerDetailsPage(edge),
                            settings: new RouteSettings(
                                name: '/notes', isInitialRoute: false),
                          ));

                      ///TODO: Add detail page behaviour. Will be added in the next blog post.
//                      Navigator.push(
//                          context,
//                          new MaterialPageRoute(
//                              builder: (BuildContext context) =>
//                                  new FlyerDetails(edge)));
                    },
                    child: new GridTile(
                        header: new GridTileBar(
                          backgroundColor: Colors.black45,
                          title: new Text(edge.node.title),
                        ),
                        child: new Image(
                            image: new NetworkImageWithRetry(
                                "https://robohash.org/${new Random().nextInt(254) + 1}.${new Random().nextInt(254) + 1}.${new Random().nextInt(254) + 1}.${new Random().nextInt(254) + 1}.png?set=set2"),
                            fit: BoxFit.cover)),
                  ))
            ])));
      }
    }
    return listElementWidgetList;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: searchBar.build(context),
      key: _scaffoldKey,
      drawer: new Drawer(
          child: new ListView(
              padding: const EdgeInsets.only(top: 0.0),
              children: _buildDrawerList(context))),
      body: buildGrid(),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {},
        tooltip: 'Create new flyer',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Widget> _buildDrawerList(BuildContext context) {
    List<Widget> children = [];
    /*
      ..addAll(_buildUserAccounts(context))
      ..addAll(_defaultLabels(context))
      ..addAll([new Divider()])
      ..addAll(_buildLabelWidgets(context))
      ..addAll([new Divider()])
      ..addAll(_buildActions(context))
      ..addAll([new Divider()])
      ..addAll([new Divider()])
    */
    children
      ..addAll(_buildHeader(context))
      ..addAll(_buildSettingAndHelp(context))
      ..addAll([new Divider(color: Colors.black)])
      ..addAll(_buildMisc(context));

    return children;
  }

  List<Widget> _buildHeader(BuildContext context) {
    return [
      new DrawerHeader(
          decoration: new BoxDecoration(
              color: new Color(Settings.colors.blue.shade500.value)),
          child: new ListTile(
              leading: new Icon(Icons.input, color: Colors.white),
              title: new Text("Sign in",
                  style: new TextStyle(fontSize: 17.0, color: Colors.white)))),
    ];
  }

  List<Widget> _buildMisc(BuildContext context) {
    String privacyPolicy = 'Privacy policy';
    String termsAndConditions = 'Terms & conditions';
    return [
      new ListTile(title: new Text(privacyPolicy)),
      new ListTile(title: new Text(termsAndConditions)),
    ];
  }

  List<Widget> _buildSettingAndHelp(BuildContext context) {
    //String settings = 'Settings';
    String helpAndFeedBack = 'Help & feedback';
    String about = 'About';
    //String signOut = 'Sign out';
    if (true) {
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
    }
    /*
      else {
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
    */
  }
}

class FadeRoute<T> extends MaterialPageRoute<T> {
  FadeRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return new FadeTransition(opacity: animation, child: child);
  }
}
