import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../core/constant/routes.dart';

class HomeScreenController extends GetxController {
  TextEditingController? cardHolderName;
  TextEditingController? bankName;
  TextEditingController? cardNumber;
  TextEditingController? cvv;
  TextEditingController? cardExpiry;
  List<QueryDocumentSnapshot> data = [];
  bool isLoading = true;

  onChangeCardHolderName(val) {
    cardHolderName!.text = val;
    update();
  }

  onChangeBankName(val) {
    bankName!.text = val;
    update();
  }

  onChangeCardNumber(val) {
    cardNumber!.text = val;
    update();
  }

  onChangeCvv(val) {
    cvv!.text = val;
    update();
  }

  onChangeCardExpiry(val) {
    cardExpiry!.text = val;
    update();
  }

  CollectionReference creditCard =
      FirebaseFirestore.instance.collection('creditCard');

  Future<void> insertData() {
    return creditCard.add({
      'id': FirebaseAuth.instance.currentUser!.uid,
      'cardHolderName': cardHolderName!.text,
      'bankName': bankName!.text,
      'cardNumber': cardNumber!.text,
      'cvv': cvv!.text,
      'cardExpiry': cardExpiry!.text,
    }).then((value) {
      print("Credit Card Added==================");
      update();
      Get.offNamed(AppRoutes.homeScreen);
      HomeScreenController controller = Get.put(HomeScreenController());
      cardHolderName!.clear();
      bankName!.clear();
      cardNumber!.clear();
      cvv!.clear();
      cardExpiry!.clear();
      controller.readData();
      update();
    }).catchError(
        (error) => print("Failed to add credit card: $error =============="));
  }

  Future<void> updateData(String docId) {
    return creditCard.doc(docId).update({
      'cardHolderName': cardHolderName!.text,
      'bankName': bankName!.text,
      'cardNumber': cardNumber!.text,
      'cvv': cvv!.text,
      'cardExpiry': cardExpiry!.text,
    }).then((value) {
      print("========================== creditCard update");

      Get.offNamed(AppRoutes.homeScreen);
      HomeScreenController c = Get.put(HomeScreenController());
      cardHolderName!.clear();
      bankName!.clear();
      cardNumber!.clear();
      cvv!.clear();
      cardExpiry!.clear();
      c.readData();
    }).catchError((error) => print("Failed to update creditCard: $error"));
  }

  readData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("creditCard")
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    data.clear();
    data.addAll(querySnapshot.docs);
    update();
    // isLoading = false;
    // update();
  }

  Future deleteData(int index) async {
    await FirebaseFirestore.instance
        .collection("creditCard")
        .doc(data[index].id)
        .delete();

    Get.offNamed(AppRoutes.homeScreen);
    HomeScreenController c = Get.put(HomeScreenController());
    c.readData();

    update();
  }

  Future logout() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
    Get.offNamed(AppRoutes.auth);
  }

  @override
  void onInit() {
    cardHolderName = TextEditingController();
    bankName = TextEditingController();
    cardNumber = TextEditingController();
    cvv = TextEditingController();
    cardExpiry = TextEditingController();

    readData();
    update();
    super.onInit();
  }
}
