import 'package:awesome_card/credit_card.dart';
import 'package:awesome_card/extra/card_type.dart';
import 'package:awesome_card/style/card_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card_firebase/controller/home_screen_controller.dart';
import 'package:flutter_credit_card_firebase/core/constant/colors.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';

class CustomCreditCard extends GetView<HomeScreenController> {
  const CustomCreditCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeScreenController controller = Get.put(HomeScreenController());
    return Container(
      height: 250,
      decoration: const BoxDecoration(
        color: AppColor.lightGrey,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: controller.data.isEmpty
          ? const Center(
              child: Text(
                "لا يوجد لديك بطاقة",
                style: TextStyle(color: AppColor.blue),
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
                      Get.defaultDialog(
                          title: "تنبيه",
                          content: const Text("هل أنت متأكد من حذف البطاقة ؟"),
                          onConfirm: () {
                            Get.back();
                            controller.deleteData(index);
                          });
                    },
                    child: CreditCard(
                      cardNumber: controller.data[index]['cardNumber'],
                      cardExpiry: controller.data[index]['cardExpiry'],
                      cardHolderName: controller.data[index]['cardHolderName'],
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
    );
  }
}
