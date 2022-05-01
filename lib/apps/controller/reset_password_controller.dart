import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../view/full_app.dart';

class ResetPasswordController extends FxController {
  late TextEditingController confirmPasswordTE, passwordTE;

  GlobalKey<FormState> formKey = GlobalKey();

  ResetPasswordController() {
    this.confirmPasswordTE = TextEditingController(text: 'password123');
    this.passwordTE = TextEditingController(text: 'password');
  }

  @override
  void initState() {
    super.initState();
  }

  String? validatePassword(String? text) {
    if (text == null || text.isEmpty) {
      return "비밀번호를 입력해주세요";
    } else if (!FxStringValidator.validateStringRange(
      text,
    )) {
      return "비밀번호는 반드시 8자리 이상이여야 합니다";
    }
    return null;
  }

  String? validateConfirmPassword(String? text) {
    if (text == null || text.isEmpty) {
      return "비밀번호를 입력해주세요";
    } else if (!FxStringValidator.validateStringRange(
      text,
    )) {
      return "비밀번호는 반드시 8자리 이상이여야 합니다";
    } else if (passwordTE.text != text) {
      return "비밀번호가 일치하지 않습니다";
    }
    return null;
  }

  void resetPassword() {
    if (formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FullApp(),
        ),
      );
    }
  }

  @override
  String getTag() {
    return "reset_password_controller";
  }
}
