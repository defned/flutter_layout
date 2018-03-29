import 'package:build_config/build_config.dart';
import 'package:build_runner/build_runner.dart';
import './graphql_fetch_generator.dart';
import '../types/GraphqlSetting.dart';
export '../types/GraphqlSetting.dart' show createSetting;

createBuildAction(GraphqlBuildSetting setting) {
  return applyToRoot(
    new GraphqlBuilder(setting),
    generateFor: const InputSet(include: const['**/*.graphql']) );
}