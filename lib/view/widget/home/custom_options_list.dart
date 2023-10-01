import 'package:flutter/material.dart';
import 'package:flutter_credit_card_firebase/controller/home_screen_controller.dart';
import 'package:flutter_credit_card_firebase/core/constant/colors.dart';
import 'package:flutter_credit_card_firebase/core/constant/routes.dart';
import 'package:get/get.dart';

class CustomOptionsList extends GetView<HomeScreenController> {
  const CustomOptionsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          InkWell(
            onTap: () => Get.toNamed(AppRoutes.myCreditCard),
            child: Card(
              color: AppColor.lightGrey,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 231, 231, 231),
                  child: Image.asset(
                    "assets/images/credit.png",
                    height: 25,
                  ),
                ),
                title: const Text(
                  "My Credit Cards",
                  style: TextStyle(
                    color: AppColor.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                trailing: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 231, 231, 231),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Icon(
                    Icons.arrow_right,
                    color: AppColor.blue,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () => Get.toNamed(AppRoutes.myAccount),
            child: Card(
              color: AppColor.lightGrey,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 231, 231, 231),
                  child: Image.asset(
                    "assets/images/account.png",
                    height: 30,
                  ),
                ),
                title: const Text(
                  "My Account",
                  style: TextStyle(
                    color: AppColor.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                trailing: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 231, 231, 231),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Icon(
                    Icons.arrow_right,
                    color: AppColor.teal,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            color: AppColor.lightGrey,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            elevation: 0,
            child: InkWell(
              onTap: () {
                Get.defaultDialog(
                  title: "تنبيه",
                  content: const Text("هل أنت متأكد من تسجيل الخروج ؟"),
                  onConfirm: () => controller.logout(),
                  onCancel: () {},
                );
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 231, 231, 231),
                  child: Image.asset(
                    "assets/images/logout.png",
                    height: 25,
                    color: AppColor.red,
                  ),
                ),
                title: const Text(
                  "Logout",
                  style: TextStyle(
                    color: AppColor.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                trailing: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 231, 231, 231),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Icon(
                    Icons.arrow_right,
                    color: AppColor.red,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
