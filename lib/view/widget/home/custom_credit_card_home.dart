
import 'package:awesome_card/credit_card.dart';
import 'package:awesome_card/extra/card_type.dart';
import 'package:awesome_card/style/card_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card_firebase/controller/home_screen_controller.dart';
import 'package:flutter_credit_card_firebase/core/constant/colors.dart';
import 'package:flutter_credit_card_firebase/view/widget/home/custom_edit_credit_card.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';

class CustomCreditCardHome extends GetView<HomeScreenController> {
  const CustomCreditCardHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
      );
  }
}

