import 'package:apple_shop/data/models/bucket_model.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:apple_shop/screan/bootom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {


  WidgetsFlutterBinding();
  await Hive.initFlutter();
  Hive.registerAdapter(BucketAdapter());
  await Hive.openBox<Bucket>("BucketBox");
  await initLocator();
  runApp(MyApp());
  
  
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigatonScrean(),
    );
  }
}
