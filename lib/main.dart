import 'package:apple_shop/data/datasource/authentication_datasource.dart';
import 'package:apple_shop/data/repository/authentication_repository.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:apple_shop/screan/bootom_navigation.dart';
import 'package:apple_shop/screan/order_screan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() async {
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
              onPressed: () async {
                final IAuthenticatinRepository auth = locator.get();

               var either= await  auth.register();

               either.fold((l) {

                print(l);

               }, (r) {

                print(r);

               });
              },
              child: Text("Clike me")),
        ),
      ),
    );
  }
}
