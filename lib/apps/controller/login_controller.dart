import 'package:alphabit_front/apps/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../view/forgot_password_screen.dart';
import '../view/full_app.dart';
import '../view/register_screen.dart';


class LogInController extends FxController {
  late TextEditingController emailTE, passwordTE;
  GlobalKey<FormState> formKey = GlobalKey();
  String _email='', _password='';


  LogInController() {
    _email='test@gmail.com';
    _password='asd123!@#';
    emailTE = TextEditingController(text: _email);
    passwordTE = TextEditingController(text: _password);
  }

  String? validateEmail(String? text) {
    if (text == null || text.isEmpty) {
      return "이메일 주소를 입력해주세요";
    } else if (FxStringValidator.isEmail(text)) {
      return "올바른 이메일 주소를 입력해주세요";
    }
    _email=text;
    return null;
  }

  String? validatePassword(String? text) {
    if (text == null || text.isEmpty) {
      return "비밀번호를 입력해주세요";
    } else if (!FxStringValidator.validateStringRange(
      text,
    )) {
      return "비밀번호는 반드시 8자리 이상이여야 합니다.";
    }
    _password=text;
    return null;
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      User userData = await User.getUserData(_email, _password);
      if(userData.id!=''){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullApp(),
          ),
        );
      }

    }
  }

  void goToForgotPasswordScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ForgotPasswordScreen(),
      ),
    );
  }

  void goToRegisterScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterScreen(),
      ),
    );
  }


  @override
  String getTag() {
    return "login_controller";
  }
}
