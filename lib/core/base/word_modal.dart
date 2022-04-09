class Word {
  String id;
  final String englishWord;
  final String turkishWord;
  final String sentenceone;
  final String sentencetwo;

  Word({
    this.id = "",
    required this.sentenceone,
    required this.sentencetwo,
    required this.englishWord,
    required this.turkishWord,
  });

  Map<String, dynamic> toJson() => {
        "english_word": englishWord,
        "turkish_word": turkishWord,
        "sentenceone": sentenceone,
        "sentencetwo": sentencetwo,
      };
  static Word fromJson(Map<String, dynamic> json) {
    return Word(
      englishWord: json["english_word"],
      turkishWord: json["turkish_word"],
      sentenceone: json["sentenceone"],
      sentencetwo: json["sentencetwo"],
    );
  }
}
