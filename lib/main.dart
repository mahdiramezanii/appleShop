import 'package:apple_shop/data/datasource/authentication_datasource.dart';
import 'package:apple_shop/data/repository/authentication_repository.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:apple_shop/screan/bootom_navigation.dart';
import 'package:apple_shop/screan/order_screan.dart';
import 'package:apple_shop/util/auth_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding();
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final IAuthenticatinRepository auth = locator.get();
                var either = await auth.login("taham", "12345678");

              },
              child: Text("Login"),
            ),
            ElevatedButton(
              onPressed: () async {
               
                AuthManager.logout();
              },
              child: Text("LogOut"),
              
            ),
            ValueListenableBuilder(
                valueListenable: AuthManager.changeAuth,
                builder: (context, value, child) {
                  if (value == null) {
                    return Text("شما لاگین نیستید");
                  } else {
                    return Text("شما لاگین هستید");
                  }
                })
          ],
        )),
      ),
    );
  }
}
