import '../entities/entities.dart';
import 'macros.dart';

class Warteg{
  String wartegId;
  String picture;
  bool isveg;
  int spicy;
  String name;
  String description;
  int price;
  int discount;
  Macros macros;

  Warteg({
    required this.wartegId,
    required this.picture,
    required this.isveg,
    required this.spicy,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.macros,
  });

  WartegEntity toentity(){
  return WartegEntity(
      wartegId: wartegId,
      picture: picture,
      isveg: isveg,
      spicy: spicy,
      name: name,
      description: description,
      price: price,
      discount: discount,
      macros: macros,
  );
}

static Warteg fromEntity(WartegEntity entity){
  return Warteg(
      wartegId: entity.wartegId,
      picture: entity.picture,
      isveg: entity.isveg,
      spicy: entity.spicy,
      name: entity.name,
      description: entity.description,
      price: entity.price,
      discount: entity.discount,
      macros: entity.macros,
  );
}
}