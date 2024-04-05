import "package:apple_shop/constants/colors.dart";
import "package:dartz/dartz.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class LoginScrean extends StatelessWidget {
  const LoginScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              "assets/images/apple_logo.png",
              width: 100,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(40),
            height: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "نام کاربری",
                    
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
