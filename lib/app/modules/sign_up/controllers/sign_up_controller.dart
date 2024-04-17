import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/routes/app_pages.dart';
import 'package:yanci/app/services/dialog_helper.dart';

class SignUpController extends GetxController {
  var isPassVisible = false.obs;
  var isConfPassVisible = false.obs;

  final formkey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  RxBool isLoding = false.obs;

  String? passwordValidater(String value) {
    if (value.isEmpty) {
      return "Password required";
    } else if (passwordController.text != confirmPasswordController.text) {
      return "Passwords do not match";
    } else if (value.length < 6) {
      return "Character must me 6 or more";
    }
    return null;
  }

  // Login functions
  void checkLogin() {
    if (!formkey.currentState!.validate()) {
      return;
    } else {
      DialogHelper.showSuccess(
        then: (p0) => Get.offAllNamed(Routes.KYC),
        title: StringConstants.successful,
        description: StringConstants.accHasBeenCreated,
      );
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
