import 'dart:async';
import '../settings.dart';
import 'package:eflyr/generated/queries.graphql.dart';
import 'package:eflyr/graphql/fetch.dart';

/// Method to get movies from the backend
Future<GraphqlResponse<GetFlyertemplatesResult>> fetchFlyers() async {
  //await signInWithGoogle();
  try {
    GraphqlClient client = new GraphqlClient(Settings.graphqlEndpoint);
    return await client
        .query(getFlyertemplates() /*await Auth.getAuthHeaders()*/);
  } catch (exception) {
    print(exception.toString());
  }
  return null;
}