import 'package:apple_shop/bloc/authentication/auth_bloc.dart';
import 'package:apple_shop/bloc/authentication/auth_event.dart';
import 'package:apple_shop/bloc/authentication/auth_state.dart';
import 'package:apple_shop/constants/colors.dart';
import 'package:apple_shop/screan/bootom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScrean extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _passwordConfirmController = TextEditingController();
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: ViewRegisterWidget(
        usernameController: _usernameController,
        passwordController: _passwordController,
        passwordConfirmController: _passwordConfirmController,
      ),
    );
  }
}

class ViewRegisterWidget extends StatelessWidget {
  const ViewRegisterWidget({
    super.key,
    required TextEditingController usernameController,
    required TextEditingController passwordController,
    required TextEditingController passwordConfirmController,
  })  : _usernameController = usernameController,
        _passwordController = passwordController,
        _passwordConfirmController = passwordConfirmController;

  final TextEditingController _usernameController;
  final TextEditingController _passwordController;
  final TextEditingController _passwordConfirmController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is ResponseAuthState) {
          state.response.fold((l) {
            var snakBar = SnackBar(
              content: Text(l),
              behavior: SnackBarBehavior.floating,
              showCloseIcon: true,
              duration: const Duration(seconds: 4),
              closeIconColor: Colors.red,
            );
            ScaffoldMessenger.of(context).showSnackBar(snakBar);
          }, (r) {
            return Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return BottomNavigatonScrean();
            }));
          });
        }
      },
      builder: (context, state) {
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 15,
                  ),
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
                                  borderSide:
                                      BorderSide(color: MyColors.blue))),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          RegisterUserEvent(
                            username: _usernameController.text,
                            password: _passwordController.text,
                            confirmPassword: _passwordConfirmController.text,
                          ),
                        );
                  },
                  child: (state is LoadingAuthState)
                      ? const CircularProgressIndicator()
                      : const Text(
                          "ثبت نام",
                          style: TextStyle(
                            color: MyColors.white,
                            fontFamily: "sb",
                            fontSize: 18,
                          ),
                        ),
                ),
                if (state is ResponseAuthState) ...{
                  state.response.fold((l) {
                    return Text("");
                  }, (r) {
                    return Text(r);
                  })
                },
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
      },
    );
  }
}
