import 'package:flutter/material.dart';
import 'package:flutter_credit_card_firebase/controller/auth_controller.dart';
import 'package:flutter_credit_card_firebase/core/constant/colors.dart';
import 'package:flutter_credit_card_firebase/view/widget/auth/custom_text_form_field.dart';
import 'package:get/get.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());
    return Form(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          const SizedBox(height: 30),
          CustomTextFormFieldAuth(
            controller: controller.usernameSignup,
            lable: const Text("Enter your username"),
            prefixIcon: const Icon(
              Icons.person,
              color: AppColor.blue,
            ),
            suffixIcon: const SizedBox(),
          ),
          CustomTextFormFieldAuth(
            controller: controller.emailSignup,
            lable: const Text("Enter your email"),
            prefixIcon: const Icon(
              Icons.email,
              color: AppColor.blue,
            ),
            suffixIcon: const SizedBox(),
          ),
          CustomTextFormFieldAuth(
            controller: controller.passwordSignup,
            lable: const Text("Enter your password"),
            prefixIcon: const Icon(
              Icons.lock,
              color: AppColor.blue,
            ),
            suffixIcon: const Icon(
              Icons.remove_red_eye,
              color: AppColor.blue,
            ),
          ),
          const SizedBox(height: 10),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(8),
            onPressed: () {
              controller.signUp();
            },
            color: AppColor.red,
            textColor: AppColor.lightGrey,
            child: const Text(
              "SignUp",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Divider(
            indent: 10,
            endIndent: 10,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
