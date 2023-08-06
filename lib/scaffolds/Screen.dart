import 'package:flutter/material.dart';
import 'Menu.dart';


class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Menu()
    );
  }
}
