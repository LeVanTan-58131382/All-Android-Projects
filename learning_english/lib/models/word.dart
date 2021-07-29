class Word {
  final String id;
  final String word;
  final String pronounce;
  final String means;

  final bool nouns;
  final bool pronouns;
  final bool adjectives;
  final bool verbs;
  final bool adverbs;
  final bool prepositions;
  final bool conjunctions;
  final bool interjections;

  const Word({
    required this.id,
    required this.word,
    required this.pronounce,
    required this.means,
    required this.nouns,
    required this.pronouns,
    required this.adjectives,
    required this.verbs,
    required this.adverbs,
    required this.prepositions,
    required this.conjunctions,
    required this.interjections});

}