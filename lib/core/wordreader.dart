import 'package:hiword/models.dart';
import 'package:yaml/yaml.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

Future<String> loadAsset(String path) async {
  return await rootBundle.loadString(path);
}

Future<Map> loadYamlFile(String path) async {
  return loadYaml(await loadAsset(path));
}

Future<List<String>> listWordPackPaths() async {
  final manifestContent = await rootBundle.loadString('AssetManifest.json');
  final Map<String, dynamic> manifestMap = json.decode(manifestContent);

  final wordPackPaths = manifestMap.keys
      .where((String key) => key.contains('wordpacks/'))
      .where((String key) => key.contains('.yml'))
      .toList();

  return wordPackPaths;
}

Future<List<WordPack>> loadWordPacks() async {
  List<WordPack> wordPacks = [];
  List<String> wordPackPaths = await listWordPackPaths();

  await Future.forEach(wordPackPaths, (String wordpackpath) async {
    Map wordpack = await loadYamlFile(wordpackpath);

    WordPack wp = WordPack(
      name: wordpack["name"],
      slug: wordpack["slug"],
      path: wordpackpath,
      count: wordpack["wordlists"].length,
      wordlists: [],
    );

    wordPacks.add(wp);
  });

  return wordPacks;
}
