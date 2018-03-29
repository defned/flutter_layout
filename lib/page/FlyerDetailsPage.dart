import 'dart:math';

import 'package:eflyr/generated/queries.graphql.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:fluttery/framing.dart';

class FlyerDetailsPage extends StatelessWidget {
  // Movie object to handle.
  GetFlyertemplates_FlyerTemplateNodeEdge flyer;
  // Constructor for the class.
  FlyerDetailsPage(this.flyer) {

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(flyer.node.title),
        ),
        body: new ListView(children: <Widget>[
          new Container(
              height:350.0,
              color: RandomColor.next(),
              child: new Image(
                  image: new NetworkImageWithRetry(
                      "https://robohash.org/${new Random().nextInt(254) + 1}.${new Random().nextInt(254) + 1}.${new Random().nextInt(254) + 1}.${new Random().nextInt(254) + 1}.png?set=set2"),
                  fit: BoxFit.cover)),
          new Container(
            padding: const EdgeInsets.all(32.0),
            child: new Row(
              children: [
                // First child in the Row for the name and the
                // Release date information.
                new Expanded(
                  // Name and Release date are in the same column
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Code to create the view for name.
                      new Container(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: new Text(
                          "Original Name: " + flyer.node.title,
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Code to create the view for release date.
                      new Text(
                        "Release Date: " + flyer.node.body,
                        style: new TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                // Icon to indicate the rating.
                new Icon(
                  Icons.star,
                  color: Colors.red[500],
                ),
                new Text('4.7'),
              ],
            ),
          )
        ]));
  }
}
