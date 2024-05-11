import 'package:apple_shop/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterScrean extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _passwordConfirmController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const SizedBox(
              width: double.infinity,
            ),
            const Text(
              "ثبت نام در اپل شاپ",
              style: TextStyle(
                color: MyColors.blue,
                fontFamily: "sb",
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    ":نام کاربری",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "sm",
                      fontSize: 18,
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                          hintText: "نام کاربری خود را وارد کنید",
                          hintStyle: TextStyle(fontFamily: "sm"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: MyColors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: MyColors.blue))),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    ":رمز عبور ",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "sm",
                      fontSize: 18,
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        hintText: "رمز عبور خود را وارد کنید",
                        hintStyle: TextStyle(fontFamily: "sm"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors.blue),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      controller: _passwordConfirmController,
                      decoration: const InputDecoration(
                        hintText: "تکرار رمز عبور",
                        hintStyle: TextStyle(fontFamily: "sm"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors.blue),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.blue,
                  maximumSize: const Size(200, 70),
                  minimumSize: const Size(150, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  )),
              onPressed: () {},
              child: const Text(
                "ثبت نام",
                style: TextStyle(
                  color: MyColors.white,
                  fontFamily: "sb",
                  fontSize: 18,
                ),
              ),
            ),
            const Spacer(),
            const Column(
              children: [
                Text(
                  "توسعه دهنده: مهدی رمضانی",
                  style: TextStyle(
                    color: MyColors.grey,
                    fontFamily: "sm",
                    fontSize: 15,
                  ),
                ),
                Text(
                  "version : 2.1.1",
                  style: TextStyle(
                    color: MyColors.grey,
                    fontFamily: "sm",
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
