import 'package:flutter/material.dart';
import 'package:flutter_credit_card_firebase/controller/auth_controller.dart';
import 'package:flutter_credit_card_firebase/core/constant/colors.dart';
import 'package:flutter_credit_card_firebase/core/constant/image_asset.dart';
import 'package:flutter_credit_card_firebase/view/widget/auth/custom_text_form_field.dart';
import 'package:get/get.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());
    return controller.isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Form(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                const SizedBox(height: 30),
                CustomTextFormFieldAuth(
                  controller: controller.emailLogin,
                  lable: const Text("Enter your email"),
                  prefixIcon: const Icon(
                    Icons.email,
                    color: AppColor.blue,
                  ),
                  suffixIcon: const SizedBox(),
                ),
                CustomTextFormFieldAuth(
                  controller: controller.passwordLogin,
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
                InkWell(
                  onTap: () => controller.forgotPassword(),
                  child: const Text(
                    "Forget Password ?",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(8),
                  onPressed: () => controller.login(),
                  color: AppColor.red,
                  textColor: AppColor.lightGrey,
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(8),
                  onPressed: () => controller.signInWithGoogle(),
                  color: AppColor.yellow,
                  textColor: AppColor.lightGrey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Login With Google",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 5),
                      Image.asset(
                        ImageAsset.google,
                        height: 20,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(
                  indent: 10,
                  endIndent: 10,
                ),
              ],
            ),
          );
  }
}
