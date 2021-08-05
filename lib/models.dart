class WordPack {
  final String name;
  final String slug;
  final String path;
  final int count;

  final List<WordList> wordlists;

  WordPack({
    required this.name,
    required this.slug,
    required this.path,
    required this.count,
    required this.wordlists,
  });
}

class WordList {
  final String name;
  final List<Word> words;
  final int count;

  WordList(this.name, this.words, this.count);
}

class Word {
  final String name;

  Word(this.name);
}
