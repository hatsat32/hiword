import 'package:yaml/yaml.dart';
import 'package:flutter/services.dart' show rootBundle;


Future<String> loadAsset(String path) async {
  return await rootBundle.loadString(path);
}

Future<Map> loadYamlFileSync(String path) async {
  return loadYaml(await loadAsset(path));
}
