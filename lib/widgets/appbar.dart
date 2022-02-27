import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar({required String title}) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    elevation: 8.0,
    backgroundColor: Colors.blueGrey[700],
    shadowColor: Colors.black,
  );
}