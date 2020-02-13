import 'package:flutter/material.dart';
import 'package:pocket_time/pages/choose_location.dart';
import 'package:pocket_time/pages/home.dart';
import 'package:pocket_time/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  debugShowCheckedModeBanner: false,
  routes: {
    '/': (context) => Loding(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
));
