class Word {
  String id;
  final String englishWord;
  final String turkishWord;

  Word({
    this.id = "",
    required this.englishWord,
    required this.turkishWord,
  });

  Map<String, dynamic> toJson() => {
        "english_word": englishWord,
        "turkish_word": turkishWord,
      };
 static Word fromJson(Map<String, dynamic> json) {
    return Word(
      englishWord: json["english_word"],
      turkishWord: json["turkish_word"],
    );
  }
}
