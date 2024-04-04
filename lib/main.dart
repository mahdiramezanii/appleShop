import 'package:apple_shop/data/datasource/authentication_datasource.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:apple_shop/screan/bootom_navigation.dart';
import 'package:apple_shop/screan/order_screan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main()async {
  await initLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                final auth = AuthenticationDataSource();

                auth.registerUser("rexac", "12345678", "12345678");
              },
              child: Text("Clike me")),
        ),
      ),
    );
  }
}
