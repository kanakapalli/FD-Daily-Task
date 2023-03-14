import 'package:get/get.dart';


import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isObscure = true.obs;

  isObscureActive() {
    isObscure.value = !isObscure.value;
  
  }

   @override
  void onInit() {
    
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}