import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card_firebase/controller/home_screen_controller.dart';
import 'package:flutter_credit_card_firebase/core/constant/colors.dart';
import 'package:flutter_credit_card_firebase/view/widget/home/custom_add_credit_card.dart';
import 'package:get/get.dart';

class CustomAppBarHome extends GetView<HomeScreenController> {
  const CustomAppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40),
      decoration: const BoxDecoration(
        color: AppColor.lightGrey,
      ),
      child: ListTile(
        title: const Text(
          "Welcome",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.blue,
          ),
        ),
        subtitle: Text(
          "${FirebaseAuth.instance.currentUser!.displayName}",
          style: const TextStyle(
            color: AppColor.blue,
          ),
        ),
        trailing: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 231, 231, 231),
              borderRadius: BorderRadius.circular(10)),
          child: IconButton(
            icon: const Icon(Icons.add, color: AppColor.blue),
            onPressed: () {
              Get.bottomSheet(
                isScrollControlled: true,
                isDismissible: false,
                const CustomAddCreditCard(),
              );
            },
          ),
        ),
      ),
    );
  }
}
