import 'package:flutter/material.dart';

class RegisterController {
  static late TextEditingController emailController;
  static late TextEditingController firstNameController;
  static late TextEditingController middleNameController;
  static late TextEditingController lastNameController;
  static late TextEditingController nationalIdController;
  static late TextEditingController phoneNumberController;
  static late TextEditingController addressController;
  static late TextEditingController passwordController;
  static late TextEditingController passwordConfirmationController;

  static initControllers() {
    emailController = TextEditingController();
    firstNameController = TextEditingController();
    middleNameController = TextEditingController();
    lastNameController = TextEditingController();
    nationalIdController = TextEditingController();
    phoneNumberController = TextEditingController();
    addressController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmationController = TextEditingController();
  }

  static disposeControllers() {
    emailController.dispose();
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    nationalIdController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
  }
}
