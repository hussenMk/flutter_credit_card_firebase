import 'package:flutter/material.dart';
import 'package:flutter_credit_card_firebase/controller/home_screen_controller.dart';
import 'package:flutter_credit_card_firebase/core/constant/colors.dart';
import 'package:flutter_credit_card_firebase/view/widget/home/custom_credit_card_home.dart';
import 'package:flutter_credit_card_firebase/view/widget/home/custom_lottie_no_data.dart';
import 'package:get/get.dart';

class CustomContainerHome extends GetView<HomeScreenController> {
  const CustomContainerHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      decoration: const BoxDecoration(
        color: AppColor.lightGrey,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: controller.data.isEmpty
          ? const CustomLottieNoData()
          : const CustomCreditCardHome(),
    );
  }
}
