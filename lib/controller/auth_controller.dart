import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card_firebase/core/constant/routes.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  TextEditingController usernameSignup = TextEditingController();
  TextEditingController emailLogin = TextEditingController();
  TextEditingController passwordSignup = TextEditingController();
  TextEditingController emailSignup = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();

  bool isLoading = false;
  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      return;
    }
    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    Get.offAllNamed(AppRoutes.homeScreen);
  }

  Future login() async {
    try {
      isLoading = true;
      update();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailLogin.text,
        password: passwordLogin.text,
      );

      FirebaseAuth.instance.currentUser!.sendEmailVerification();
      isLoading = false;
      update();

      if (credential.user!.emailVerified) {
        Get.offNamed(AppRoutes.homeScreen);
      } else {
        Get.defaultDialog(
          title: "تنبيه",
          content: const Text("الرجاء التحقق من البريد الالكتروني"),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.defaultDialog(
          title: "تنبيه",
          content: const Text("No user found for that email."),
        );
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
          title: "تنبيه",
          content: const Text('Wrong password provided for that user.'),
        );
      }
    }
  }

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailSignup.text,
        password: passwordSignup.text,
      );

      FirebaseAuth.instance.currentUser!.sendEmailVerification();
      Get.offNamed(AppRoutes.auth);
      Get.defaultDialog(
        title: "تنبيه",
        content: const Text("تم ارسال  رسالة التحقق إلى بريدك الالكتروني"),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.defaultDialog(
          content: const Text('The password provided is too weak.'),
        );
      } else if (e.code == 'email-already-in-use') {
        Get.defaultDialog(
          content: const Text('The account already exists for that email.'),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future forgotPassword() async {
    if (emailLogin.text == "") {
      Get.defaultDialog(
        title: "تنبيه",
        content: const Text("الرجاء إدخال البريد الإلكتروني"),
      );

      return;
    }
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailLogin.text);

      Get.defaultDialog(
        title: "تنبيه",
        content: const Text(
            "تم ارسال  رسالة تغيير كلمة المرور الى بريدك الالكتروني"),
      );
    } catch (e) {
      print(e);
    }
  }

  Future resetPassword() async {
    try {
      //! التراي والكاتش عشان لو دخل بريد مو موجود في قاعدة البيانات
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: FirebaseAuth.instance.currentUser!.email.toString());

      Get.defaultDialog(
        title: "تنبيه",
        content: const Text(
            "تم ارسال  رسالة تغيير كلمة المرور الى بريدك الالكتروني"),
      );
    } catch (e) {
      print(e);
    }
  }
}
