import 'package:warteg_repository/src/entities/macros_entity.dart';

import '../models/macros.dart';

class WartegEntity {
  String wartegId;
  String picture;
  bool isveg;
  int spicy;
  String name;
  String description;
  int price;
  int discount;
  Macros macros;

  WartegEntity({
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

  Map<String, Object?> toDocument() {
    return {
      'wartegId': wartegId,
      'picture': picture,
      'isveg': isveg,
      'spicy': spicy,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'macros': macros.toentity().toDocument(),
    };
  }

  static WartegEntity fromDocument(Map<String, dynamic> doc) {
    return WartegEntity(
      wartegId: doc['wartegId'],
      picture: doc['picture'],
      isveg: doc['isveg'],
      spicy: doc['spicy'],
      name: doc['name'],
      description: doc['description'],
      price: doc['price'],
      discount: doc['discount'],
      macros: Macros.fromEntity(MacrosEntity.fromDocument(doc['macros'])),
    );
  }
}