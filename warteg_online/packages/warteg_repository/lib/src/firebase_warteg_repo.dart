import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:warteg_repository/warteg_repository.dart';


class FirebaseWartegRepo implements Warteg_Repo{
  final wartegCollection = FirebaseFirestore.instance.collection('wartegs');

@override
  Future<List<Warteg>> getWarteg() async {
    try {
      return await wartegCollection
        .get()
        .then((value) => value.docs.map((e) => 
          Warteg.fromEntity(WartegEntity.fromDocument(e.data()))
        ).toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}