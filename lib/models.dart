class WordPack {
  final String name;
  final String slug;
  final List<WordList> wordlists;

  WordPack(this.name, this.slug, this.wordlists);
}

class WordList {
  final String name;
  final List<Word> words;

  WordList(this.name, this.words);
}

class Word {
  final String name;

  Word(this.name);
}
