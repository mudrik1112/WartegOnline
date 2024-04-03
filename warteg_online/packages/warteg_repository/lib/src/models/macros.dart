import '../entities/macros_entity.dart';

class Macros{
  int kalori;
  int protein;
  int lemak;
  int karbo;



  Macros({
    required this.kalori,
    required this.protein,
    required this.lemak,
    required this.karbo,
  });
    MacrosEntity toentity(){
  return MacrosEntity(
      kalori : kalori,
      protein : protein,
      lemak : lemak,
      karbo : karbo,
  );
}

static Macros fromEntity(MacrosEntity entity){
  return Macros(
      kalori : entity.kalori,
      protein : entity.protein,
      lemak : entity.lemak,
      karbo : entity.karbo,
  );
}
}