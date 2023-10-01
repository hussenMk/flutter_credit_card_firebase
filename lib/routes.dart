import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_credit_card_firebase/view/screen/auth.dart';
import 'package:flutter_credit_card_firebase/view/screen/home_screen.dart';
import 'package:flutter_credit_card_firebase/view/screen/my_account.dart.dart';
import 'package:flutter_credit_card_firebase/view/screen/my_credit_card.dart';

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'core/constant/routes.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/",
    page: () => (FirebaseAuth.instance.currentUser != null &&
            FirebaseAuth.instance.currentUser!.emailVerified)
        ? const HomeScreen()
        : const Auth(),
  ),
  GetPage(name: AppRoutes.auth, page: () => const Auth()),
  GetPage(name: AppRoutes.homeScreen, page: () => const HomeScreen()),
  GetPage(name: AppRoutes.myCreditCard, page: () => const MyCreditCard()),
  GetPage(name: AppRoutes.myAccount, page: () => const MyAccount()),
];
