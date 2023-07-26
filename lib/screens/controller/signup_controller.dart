import 'package:basica/screens/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final phoneNo = TextEditingController();

  //Call this Function from Design & it will do the rest
  Future<void> registerUser(
      String email, String password, String name, String phoneNo) async {
    String? error = AuthenticationRepository.instance
            .createUserWithEmailAndPassword(email, password, name, phoneNo)
        as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }
}
