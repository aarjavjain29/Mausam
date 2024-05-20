import 'package:flutter/material.dart';
import 'package:project/pages/loading.dart';
import 'package:project/pages/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/home": (context) => const Home(),
      "/": (context) => const Loading(),
      "/loading": (context) => const Loading(),
    },
  ));
}
