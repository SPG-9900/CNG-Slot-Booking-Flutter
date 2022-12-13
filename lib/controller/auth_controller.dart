import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:slot_booking/pages/home_screen.dart';
import 'package:slot_booking/pages/login_screen.dart';
import 'package:slot_booking/utils/mytheme.dart';

class AuthController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cnfPassController = TextEditingController();
  final mobileController = TextEditingController();
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  bool isLoging = false;
  final FirebaseAuth auth = FirebaseAuth.instance;

  get user => null;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.authStateChanges());
    ever(_user, loginRedirect);
  }

  loginRedirect(User? user) {
    Timer(Duration(seconds: isLoging ? 0 : 2), () {
      if (user == null) {
        isLoging = false;
        Get.offAll(() => const LoginScreen());
      } else {
        isLoging = true;
        update();
        Get.offAll(() => HomeScreen());
      }
    });
  }

  void registerUser(email, password) async {
    try {
      isLoging = true;
      update();
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      getErrorSnackbar("Account creation Failed", e);
    }
  }

  void login(email, password) async {
    try {
      isLoging = true;
      update();
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      getErrorSnackbar("Login Failed", e);
    }
  }

  void googleLogin() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    isLoging = true;
    update();
    try {
      googleSignIn.disconnect();
    } catch (e) {}
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        // ignore: unnecessary_nullable_for_final_variable_declarations
        final GoogleSignInAuthentication? googleAuth =
            await googleSignInAccount.authentication;
        final credentials = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
        await auth.signInWithCredential(credentials);
      }
    } on FirebaseAuthException catch (e) {
      getErrorSnackbar("Google Login Failed", e);
    }
  }

  void forgotPassword(email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      getSuccessSnackBar(
          "Reset mail sent successfully. check mail if not found please check in spam");
    } on FirebaseAuthException catch (e) {
      getErrorSnackbar("Error", e);
    }
  }

  getErrorSnackbar(String message, _) {
    Get.snackbar(
      "Error",
      "$message\n${_.message}",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: MyTheme.redBorder,
      colorText: Colors.white,
      borderRadius: 10,
      // ignore: prefer_const_constructors
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

  getSuccessSnackBar(String message) {
    Get.snackbar(
      "Success",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: MyTheme.greenTextColor,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

  void signOut() async {
    await auth.signOut();
  }
}
