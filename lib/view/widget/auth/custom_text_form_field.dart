import 'package:flutter/material.dart';
import 'package:flutter_credit_card_firebase/core/constant/colors.dart';

class CustomTextFormFieldAuth extends StatelessWidget {
  final TextEditingController? controller;
  final Widget lable;
  final Widget prefixIcon;
  final Widget suffixIcon;

  const CustomTextFormFieldAuth({
    super.key,
    required this.lable,
    required this.prefixIcon,
    required this.suffixIcon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      // decoration: BoxDecoration(color: AppColor.white.withOpacity(0.5)),
      child: TextFormField(
        controller: controller,
        // keyboardType: keyboardType,
        // validator: validator,
        // obscureText: obscureText == null || obscureText == false ? false : true,

        decoration: InputDecoration(
          fillColor: Colors.black.withOpacity(0.1),
          filled: true,
          label: lable,
          labelStyle: const TextStyle(
            color: AppColor.blue,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
