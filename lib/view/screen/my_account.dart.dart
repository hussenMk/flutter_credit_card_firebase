import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card_firebase/controller/auth_controller.dart';
import 'package:flutter_credit_card_firebase/core/constant/colors.dart';
import 'package:flutter_credit_card_firebase/view/widget/home/custom_button_home.dart';

import 'package:get/get.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
        titleTextStyle: const TextStyle(
          color: AppColor.blue,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        centerTitle: true,
        backgroundColor: AppColor.lightGrey,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: AppColor.blue,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "${FirebaseAuth.instance.currentUser!.email}",
                hintStyle: const TextStyle(
                  color: AppColor.blue,
                ),
                fillColor: const Color.fromARGB(255, 237, 237, 237),
                filled: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            CustomMaterialButtonHome(
              onPressed: () {
                controller.resetPassword();
              },
              txt: 'Reset Password',
              color: AppColor.red,
            ),
          ],
        ),
      ),
    );
  }
}
