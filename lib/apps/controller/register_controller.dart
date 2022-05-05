import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../constant.dart';
import '../view/full_app.dart';
import '../view/login_screen.dart';
import 'package:alphabit_front/apps/constant.dart';

import 'package:http/http.dart' as http;

Uri register_url = Uri.parse( SERVER_URL + "/auth/local/register");

class RegisterController extends FxController {
  late TextEditingController nameTE, emailTE, passwordTE, passwordConfirmTE;
  GlobalKey<FormState> formKey = GlobalKey();
  late String _name='', _email='', _password='';

  RegisterController() {
    nameTE = TextEditingController();
    emailTE = TextEditingController();
    passwordTE = TextEditingController();
    passwordConfirmTE = TextEditingController();
  }

  static Future<dynamic> register_user(_email, _name, _password) async {
    Map<String,String> headers = {
      'Content-Type':'application/json',
      'Accept': 'application/json',
    };
    dynamic body ={
      'email' : _email,
      'password' : _password,
      'username' : _name
    };

    http.Response response = await http.post(register_url, headers: headers, body:json.encode(body));
    if (response.statusCode == 200) {
      print('success');
      return response;
    }else
      print('fail');

  }

  String? validateEmail(String? text) {
    if (text == null || text.isEmpty) {
      return "이메일을 입력해 주세요";
    } else if (FxStringValidator.isEmail(text)) {
      return "올바를 이메일을 입력해 주세요";
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
      return "비밀번호는 반드시 8자리 이상이여야 합니다";
    }
    _password=text;
    return null;
  }

  String? validateName(String? text) {
    if (text == null || text.isEmpty) {
      return "이름(닉네임)을 입력해주세요";
    } else if (!FxStringValidator.validateStringRange(text, 4, 20)) {
      return "이름(닉네임)은 반드시 4자리 이상이여야 합니다";
    }
    _name=text;
    return null;
  }

  @override
  void initState() {
    super.initState();
  }


  void register() {
    if (formKey.currentState!.validate()) {
      register_user(_email, _name, _password).then((value) => {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LogInScreen(),
          ),
        )
      });

    }
  }

  void goToLogInScreen() {
    Navigator.pop(context);
  }

  void goBack() {
    Navigator.pop(context);
  }

  @override
  String getTag() {
    return "register_controller";
  }
}
