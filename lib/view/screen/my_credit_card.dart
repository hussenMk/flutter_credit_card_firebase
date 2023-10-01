import 'package:awesome_card/credit_card.dart';
import 'package:awesome_card/extra/card_type.dart';
import 'package:awesome_card/style/card_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card_firebase/controller/home_screen_controller.dart';
import 'package:flutter_credit_card_firebase/core/constant/colors.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MyCreditCard extends StatelessWidget {
  const MyCreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController controller = Get.put(HomeScreenController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Credit Cards'),
        titleTextStyle: const TextStyle(
          color: AppColor.blue,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        centerTitle: true,
        backgroundColor: AppColor.lightGrey,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColor.blue),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            controller.data.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset('assets/lottie/crdit-card.json'),
                        const SizedBox(),
                        const Text(
                          '! لا يوجد لديك بطائق ائتمان',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColor.blue,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CreditCard(
                        cardNumber: controller.data[index]['cardNumber'],
                        cardExpiry: controller.data[index]['cardExpiry'],
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
                      );
                    },
                    itemCount: controller.data.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      height: 15,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
