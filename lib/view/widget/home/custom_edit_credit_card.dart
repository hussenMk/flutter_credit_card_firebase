import 'package:awesome_card/credit_card.dart';
import 'package:awesome_card/extra/card_type.dart';
import 'package:awesome_card/style/card_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card_firebase/controller/home_screen_controller.dart';
import 'package:flutter_credit_card_firebase/core/constant/colors.dart';
import 'package:flutter_credit_card_firebase/view/widget/home/custom_button_home.dart';
import 'package:flutter_credit_card_firebase/view/widget/home/custom_text_form_filed_home.dart';
import 'package:get/get.dart';

class CustomEditCreditCard extends GetView<HomeScreenController> {
  const CustomEditCreditCard(
    this.docId,
    this.index, {
    super.key,
  });

  final String docId;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.lightGrey,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      height: 650,
      padding: const EdgeInsets.all(20),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          GetBuilder<HomeScreenController>(
            builder: (controller) => CreditCard(
              cardNumber: controller.cardNumber!.text,
              cardExpiry: controller.cardExpiry!.text,
              cardHolderName: controller.cardHolderName!.text,
              cvv: controller.cvv!.text,
              bankName: controller.bankName!.text,
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
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          CustomTextFormFieldHome(
            onChanged: (val) => controller.onChangeCardNumber(val),
            hintText: 'Card Number',
            controller: controller.cardNumber!,
            maxLength: 16,
            textInputType: TextInputType.number,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: CustomTextFormFieldHome(
                  onChanged: (val) => controller.onChangeBankName(val),
                  hintText: 'Bank Name',
                  controller: controller.bankName!,
                  maxLength: 3,
                  textInputType: TextInputType.name,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: CustomTextFormFieldHome(
                  hintText: 'Card Holder Name',
                  controller: controller.cardHolderName!,
                  maxLength: 20,
                  textInputType: TextInputType.name,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: CustomTextFormFieldHome(
                  onChanged: (val) => controller.onChangeCardExpiry(val),
                  hintText: 'Card Expiry',
                  maxLength: 5,
                  textInputType: TextInputType.datetime,
                  controller: controller.cardExpiry!,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: CustomTextFormFieldHome(
                  onChanged: (val) => controller.onChangeCvv(val),
                  hintText: 'CVV',
                  controller: controller.cvv!,
                  maxLength: 3,
                  textInputType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          CustomMaterialButtonHome(
            onPressed: () {
              controller.updateData(docId);
              Get.back();
            },
            txt: 'Update Data',
            color: AppColor.blue,
          ),
          CustomMaterialButtonHome(
            onPressed: () {
              Get.defaultDialog(
                title: "تنبيه !",
                content: const Text("هل أنت متأكد من حذف البطاقة ؟"),
                onConfirm: () {
                  controller.deleteData(index);
                  Get.back();
                },
                onCancel: () {},
              );
            },
            txt: 'Delete Card',
            color: AppColor.red,
          ),
        ],
      ),
    );
  }
}
