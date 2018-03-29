// GENERATED CODE - DO NOT MODIFY BY HAND

import '../graphql/fetch.dart';
import 'dart:core';

class GetFlyertemplates_BusinessNode extends MapObject {
  String get name => this["name"];
  double get long => this["long"];
  static GetFlyertemplates_BusinessNode fromMap(Map map) {
    return map == null ? null : new GetFlyertemplates_BusinessNode()
      ..map.addAll(map);
  }
}

class GetFlyertemplates_FlyerTemplateNode extends MapObject {
  String get title => this["title"];
  String get body => this["body"];
  GetFlyertemplates_BusinessNode get business =>
      GetFlyertemplates_BusinessNode.fromMap(this["business"]);
  static GetFlyertemplates_FlyerTemplateNode fromMap(Map map) {
    return map == null ? null : new GetFlyertemplates_FlyerTemplateNode()
      ..map.addAll(map);
  }
}

class GetFlyertemplates_FlyerTemplateNodeEdge extends MapObject {
  GetFlyertemplates_FlyerTemplateNode get node =>
      GetFlyertemplates_FlyerTemplateNode.fromMap(this["node"]);
  static GetFlyertemplates_FlyerTemplateNodeEdge fromMap(Map map) {
    return map == null ? null : new GetFlyertemplates_FlyerTemplateNodeEdge()
      ..map.addAll(map);
  }
}

class GetFlyertemplates_FlyerTemplateNodeConnection extends MapObject {
  Iterable<GetFlyertemplates_FlyerTemplateNodeEdge> get edges =>
      this["edges"]?.map(GetFlyertemplates_FlyerTemplateNodeEdge.fromMap);
  static GetFlyertemplates_FlyerTemplateNodeConnection fromMap(Map map) {
    return map == null
        ? null
        : new GetFlyertemplates_FlyerTemplateNodeConnection()
      ..map.addAll(map);
  }
}

class GetFlyertemplatesResult extends MapObject {
  GetFlyertemplates_FlyerTemplateNodeConnection get flyertemplates =>
      GetFlyertemplates_FlyerTemplateNodeConnection
          .fromMap(this["flyertemplates"]);
  static GetFlyertemplatesResult fromMap(Map map) {
    return map == null ? null : new GetFlyertemplatesResult()
      ..map.addAll(map);
  }
}

GraphqlQuery<GetFlyertemplatesResult> getFlyertemplates() {
  const query = """query getFlyertemplates {
  flyertemplates {
    edges {
      node {
        title
        body
        business {
          name
          long
          long
        }
      }
    }
  }
}""";
  return new GraphqlQuery(query, null, GetFlyertemplatesResult.fromMap);
}
