import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:slot_booking/controller/auth_controller.dart';
import 'package:slot_booking/pages/pages/registration_screen.dart';
import 'package:slot_booking/utils/mytheme.dart';
import 'package:slot_booking/utils/social_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final forgotEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 131, 232),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: _size.height,
          width: _size.width,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SvgPicture.asset("assets/icons/car.svg"),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                "WELCOME TO BOOK SLOT",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              "Hello sir/mam we are happy to help you...",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              width: _size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Log in",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 240, 2, 2),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        hintText: "Username",
                        hintStyle: const TextStyle(color: Colors.black45),
                        fillColor: MyTheme.greyColor,
                        filled: true,
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        hintText: "Password",
                        hintStyle: const TextStyle(color: Colors.black45),
                        fillColor: MyTheme.greyColor,
                        filled: true,
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Get.defaultDialog(
                          title: "Forgort Password?",
                          content: TextFormField(
                            style: const TextStyle(color: Colors.black),
                            controller: forgotEmailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none,
                              ),
                              hintText: "Email address",
                              hintStyle: const TextStyle(color: Colors.black45),
                              fillColor: MyTheme.greyColor,
                              filled: true,
                            ),
                          ),
                          radius: 10,
                          onWillPop: () {
                            forgotEmailController.text = "";

                            return Future.value(true);
                          },
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          confirm: ElevatedButton(
                            onPressed: () {
                              AuthController.instance.forgotPassword(
                                  forgotEmailController.text.trim());
                              forgotEmailController.text = "";
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 22, 131, 232),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(12),
                                child: Text(
                                  "Send Reset Mail",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      AuthController.instance.login(emailController.text.trim(),
                          passwordController.text.trim());
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 22, 131, 232),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "LOG IN",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            "OR",
                            style: TextStyle(color: Color(0xFFC1C1C1)),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: SocialLoginButtons(
                        onFbClick: () {},
                        onGoogleClick: () {
                          AuthController.instance.googleLogin();
                        }),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(
                        fontWeight: FontWeight.w800, fontSize: 17),
                  ),
                  TextSpan(
                    text: "Sign up ",
                    style: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w900,
                        fontSize: 17),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (_) => SignUpScreen()));
                        Get.to(RegistrationScreen());
                      },
                  ),
                  TextSpan(
                    text: "here",
                    style: const TextStyle(
                        fontWeight: FontWeight.w800, fontSize: 17),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
