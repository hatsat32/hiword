class WordPack {
  final String name;
  final String slug;
  final String? path;
  final int? count;

  final List<WordList> wordlists;

  WordPack({
    required this.name,
    required this.slug,
    required this.path,
    required this.count,
    required this.wordlists,
  });

  factory WordPack.fromJson(Map<String, dynamic> json) {
    var list = json['wordlists'] as List;
    List<WordList> wordlists = list.map((i) => WordList.fromJson(i)).toList();

    return WordPack(
      name: json['name'],
      slug: json["slug"],
      path: json["path"],
      count: wordlists.length,
      wordlists: wordlists,
    );
  }
}

class WordList {
  final String name;
  final List<Word> words;
  final int? count;

  WordList({required this.name, required this.words, required this.count});

  factory WordList.fromJson(Map<String, dynamic> json) {
    var list = json['words'] as List;
    List<Word> words = list.map((i) => Word.fromJson(i)).toList();

    return WordList(
      name: json['name'],
      words: words,
      count: words.length,
    );
  }
}

class Word {
  final String name;
  final List<Meaning> meanings;

  Word({required this.name, required this.meanings});

  factory Word.fromJson(Map<String, dynamic> json) {
    var list = json['meanings'] as List;
    List<Meaning> meanings = list.map((i) => Meaning.fromJson(i)).toList();

    return Word(name: json['name'], meanings: meanings);
  }
}

class Meaning {
  final String? en;
  final String? tr;

  Meaning({this.en, this.tr});

  factory Meaning.fromJson(Map<String, dynamic> json) {
    return Meaning(en: json['en'], tr: json['tr']);
  }
}
