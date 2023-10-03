import 'package:flutter/material.dart';
import 'package:flutter_credit_card_firebase/controller/home_screen_controller.dart';
import 'package:flutter_credit_card_firebase/core/constant/colors.dart';
import 'package:flutter_credit_card_firebase/view/widget/home/custom_app_bar_home.dart';
import 'package:flutter_credit_card_firebase/view/widget/home/custom_container_home.dart';
import 'package:flutter_credit_card_firebase/view/widget/home/custom_options_list.dart';
import 'package:flutter_credit_card_firebase/view/widget/home/custom_title.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return Scaffold(
      body: GetBuilder<HomeScreenController>(
        builder: (controller) => Container(
          color: AppColor.white,
          child: ListView(
            padding: const EdgeInsets.all(0),
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              CustomAppBarHome(),
              CustomContainerHome(),
              SizedBox(height: 20),
              CustomTitle(txt: 'Features '),
              SizedBox(height: 10),
              CustomOptionsList(),
            ],
          ),
        ),
      ),
    );
  }
}
