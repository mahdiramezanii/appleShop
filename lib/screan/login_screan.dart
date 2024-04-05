import "package:apple_shop/constants/colors.dart";
import "package:dartz/dartz.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class LoginScrean extends StatelessWidget {
  LoginScrean({super.key});

  final TextEditingController _usernameTextController=TextEditingController();
  final TextEditingController _passwordTextController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(40),
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _usernameTextController,
                    decoration: InputDecoration(
                      labelText: "نام کاربری",
                      labelStyle: const TextStyle(
                        fontFamily: "sm",
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: MyColors.grey,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 3,
                          color: MyColors.blue,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _passwordTextController,
                    decoration: InputDecoration(
                      labelText: "رمز عبور",
                      labelStyle: const TextStyle(
                        fontFamily: "sm",
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: MyColors.grey,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            const BorderSide(width: 3, color: MyColors.blue),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                      backgroundColor: MyColors.green,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "ورود به حساب کاربری",
                      style: TextStyle(
                          fontFamily: "sb", color: Colors.white, fontSize: 18),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
