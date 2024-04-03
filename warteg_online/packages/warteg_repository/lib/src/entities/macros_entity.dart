class MacrosEntity {
  int kalori;
  int protein;
  int lemak;
  int karbo;

  MacrosEntity({
    required this.kalori,
    required this.protein,
    required this.lemak,
    required this.karbo,
  });

  Map<String, Object?> toDocument() {
    return {
      'kalori': kalori,
      'protein': protein,
      'lemak': lemak,
      'karbo': karbo,
    };
  }

  static MacrosEntity fromDocument(Map<String, dynamic> doc) {
    return MacrosEntity(
      kalori: doc['kalori'],
      protein: doc['protein'],
      lemak: doc['lemak'],
      karbo: doc['karbo'],
    );
  }
}