import 'package:apple_shop/screan/category_screan.dart';
import 'package:apple_shop/screan/home_screan.dart';
import 'package:apple_shop/screan/profile_screan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: ProfileScrean(),
    );
  }

 
}
