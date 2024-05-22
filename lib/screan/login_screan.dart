import "package:apple_shop/bloc/authentication/auth_bloc.dart";
import "package:apple_shop/bloc/authentication/auth_event.dart";
import "package:apple_shop/bloc/authentication/auth_state.dart";
import "package:apple_shop/constants/colors.dart";
import "package:apple_shop/screan/bootom_navigation.dart";
import "package:apple_shop/screan/register_screan.dart";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class LoginScrean extends StatelessWidget {
  LoginScrean({super.key});

  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return AuthBloc();
      },
      child: ViewLoginWidget(
        usernameTextController: _usernameTextController,
        passwordTextController: _passwordTextController,
      ),
    );
  }
}

class ViewLoginWidget extends StatelessWidget {
  const ViewLoginWidget({
    super.key,
    required TextEditingController usernameTextController,
    required TextEditingController passwordTextController,
  })  : _usernameTextController = usernameTextController,
        _passwordTextController = passwordTextController;

  final TextEditingController _usernameTextController;
  final TextEditingController _passwordTextController;

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
                  BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
                    if (state is ResponseAuthState) {
                      state.response.fold((l) {
                        _usernameTextController.text = "";
                        _passwordTextController.text = "";
                        var snakBar = SnackBar(
                          content: Text(l),
                          showCloseIcon: true,
                          closeIconColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                          duration: const Duration(seconds: 2),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          snakBar,
                        );
                      }, (r) {
                        return Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return BottomNavigatonScrean();
                        }));
                      });
                    }
                  }, builder: (context, state) {
                    if (state is InitAuthState) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 50),
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

                    if (state is ResponseAuthState) {
                      Widget widget = const Text("");

                      state.response.fold((l) {
                        widget = ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(200, 50),
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
                      }, (r) {
                        widget = Text(
                          r,
                          style: const TextStyle(color: Colors.blue),
                        );
                      });

                      return widget;
                    }

                    return const Text("خطا");
                  }),
                  const SizedBox(
                    height: 7,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return RegisterScrean();
                        }),
                      );
                    },
                    child: const Text(
                      "حساب کاربری ندارید؟",
                      style: TextStyle(
                        color: MyColors.grey,
                        fontFamily: "sm",
                      ),
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
