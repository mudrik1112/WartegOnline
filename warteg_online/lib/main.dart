import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nasi_uduk/app.dart';
import 'package:nasi_uduk/simple_bloc_observer.dart';
import 'package:user_repository/user_repository.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleObserver();
  runApp( MyApp(FirebaseUserRepo()));

}



