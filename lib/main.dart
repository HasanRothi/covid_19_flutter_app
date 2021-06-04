import 'package:first_flutter_app/test.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'loading.dart';
import 'package:first_flutter_app/home.dart';

void main() => runApp(MaterialApp(
      routes: {
        '/': (context) => Loading(),
        '/test': (context) => Test(),
        '/home': (context) => Home(),
      },
    ));
