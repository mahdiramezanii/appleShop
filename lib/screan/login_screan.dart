import "package:apple_shop/bloc/authentication/auth_bloc.dart";
import "package:apple_shop/bloc/authentication/auth_event.dart";
import "package:apple_shop/bloc/authentication/auth_state.dart";
import "package:apple_shop/constants/colors.dart";
import "package:dartz/dartz.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class LoginScrean extends StatelessWidget {
  LoginScrean({super.key});

  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

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
                  BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                    if (state is InitAuthState) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(200, 50),
                          backgroundColor: MyColors.green,
                        ),
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context).add(
                            RequestLoginEvent(
                              username: _usernameTextController.text,
                              password: _passwordTextController.text,
                            ),
                          );
                        },
                        child: const Text(
                          "ورود به حساب کاربری",
                          style: TextStyle(
                            fontFamily: "sb",
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      );
                    }

                    if (state is LoadingAuthState) {
                      return const CircularProgressIndicator();
                    }

                    if (state is ResponseAuthState){

                      Text widget=Text("");

                      state.response.fold((l) {
                        widget=Text(l,style: TextStyle(color: Colors.red),);

                      }, (r) {

                        widget=Text(r,style: TextStyle(color: Colors.blue),);

                      });

                      return widget;
                    }

                    return Text("خطا");
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
