// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Align(alignment: Alignment.center),
          Text("Hello World"),
        ],
      ),
    );
  }
}