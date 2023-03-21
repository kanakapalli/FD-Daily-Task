import 'package:daily_task/app/services/network/network_calls/authantication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/routes/app_pages.dart';
import '../../../services/network/client/dio_factory.dart';

class LoginController extends GetxController {
  RxBool isObscure = true.obs;

  isObscureActive() {
    isObscure.value = !isObscure.value;
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  login() {
    if (formKey.currentState!.validate()) {
      AuthenticationApi(dio)
          .login(
              username: emailController.text, password: passwordController.text)
          .then((value) => {Get.toNamed(Routes.dashboard)})
          .catchError((onError){
            // if()
            Get.snackbar('error at login', onError.toString());
          });
    }
  }
}
