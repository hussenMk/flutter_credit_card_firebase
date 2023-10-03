import 'package:awesome_card/credit_card.dart';
import 'package:awesome_card/extra/card_type.dart';
import 'package:awesome_card/style/card_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card_firebase/controller/home_screen_controller.dart';
import 'package:flutter_credit_card_firebase/core/constant/colors.dart';
import 'package:flutter_credit_card_firebase/view/widget/home/custom_app_bar_home.dart';
import 'package:flutter_credit_card_firebase/view/widget/home/custom_edit_credit_card.dart';
import 'package:flutter_credit_card_firebase/view/widget/home/custom_options_list.dart';
import 'package:flutter_credit_card_firebase/view/widget/home/custom_title.dart';

import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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
            children: [
              const CustomAppBarHome(),
              Container(
                height: 280,
                decoration: const BoxDecoration(
                  color: AppColor.lightGrey,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: controller.data.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset('assets/lottie/crdit-card.json'),
                            const SizedBox(),
                            const Text(
                              "You don't have credit cards !",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColor.blue,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(5),
                        child: Swiper(
                          itemWidth: 400,
                          itemHeight: 225,
                          loop: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.bottomSheet(
                                  isScrollControlled: true,
                                  isDismissible: false,
                                  CustomEditCreditCard(
                                    controller.data[index].id,
                                    index,
                                  ),
                                );
                              },
                              child: CreditCard(
                                cardNumber: controller.data[index]
                                    ['cardNumber'],
                                cardExpiry: controller.data[index]
                                    ['cardExpiry'],
                                cardHolderName: controller.data[index]
                                    ['cardHolderName'],
                                cvv: controller.data[index]['cvv'],
                                bankName: controller.data[index]['bankName'],
                                cardType: CardType.masterCard,
                                showBackSide: false,
                                frontBackground: CardBackgrounds.custom(
                                  AppColor.blue.value,
                                ),
                                backBackground: CardBackgrounds.custom(
                                  AppColor.blue.value,
                                ),
                                frontTextColor: AppColor.lightGrey,
                                backTextColor: AppColor.lightGrey,
                                showShadow: false,
                                textExpDate: 'Exp. Date',
                              ),
                            );
                          },
                          itemCount: controller.data.length,
                          layout: SwiperLayout.STACK,
                        ),
                      ),
              ),
              const SizedBox(height: 20),
              const CustomTitle(txt: 'Features'),
              const SizedBox(height: 10),
              const CustomOptionsList(),

              
            ],
          ),
        ),
      ),
    );
  }
}
