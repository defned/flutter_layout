import 'dart:async';
import 'package:build_runner/build_runner.dart';
import '../lib/graphql/generator/action.dart';

var action = createBuildAction(
    createSetting(
        schemaUrl: "http://django-public-eflyr-django.193b.starter-ca-central-1.openshiftapps.com/graphql"));


Future main() async {
  await build([action], deleteFilesByDefault: false);
  await watch([action]);
}