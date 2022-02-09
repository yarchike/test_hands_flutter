import 'package:flutter/material.dart';
import 'package:test_hands_flutter/page/cellularFilling.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner:false,
    theme: ThemeData(primaryColor: Colors.deepOrangeAccent, appBarTheme: AppBarTheme(color: Color(0xff310050), elevation: 0)),
    initialRoute: '/',
    routes:{
      '/':(context) => CellularFilling()
    },
  ));
}


