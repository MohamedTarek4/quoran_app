import 'package:flutter/material.dart';
import 'package:quran/screen/welcome.dart';


void main() {
  runApp( 
   const MaterialApp(
    title: "Quran App",
    home: WelcomePage(),
    debugShowCheckedModeBanner: false,
    ),
  );
}
