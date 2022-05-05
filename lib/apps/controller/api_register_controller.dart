import 'package:alphabit_front/apps/model/apikey_data.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';


import '../view/full_app.dart';

class ApiRegisterController extends FxController {
  late TextEditingController publicKeyTE, privateKeyTE;
  GlobalKey<FormState> formKey = GlobalKey();
  late String _publicKey='', _privateKey='';

  ApiRegisterController() {
    publicKeyTE = TextEditingController();
    privateKeyTE = TextEditingController();
  }

  String? validatePublicKey(String? text) {
    if (text == null || text.isEmpty) {
      return "Public Key를 입력해 주세요";
    }else{
      _publicKey = text;
    }
    return null;
  }

  String? validatePrivateKey(String? text) {
    if (text == null || text.isEmpty) {
      return "Private Key를 입력해주세요";
    }else{
      _privateKey=text;
    }
    return null;
  }



  void register() {
    if (formKey.currentState!.validate()) {
      ApikeyData.putApiKeyData(_publicKey, _privateKey, 'upbit').then((value){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("성공적으로 API가 등록되었습니다."),
        ));
        Navigator.pop(context, true);
      });
      privateKeyTE=TextEditingController();
      publicKeyTE=TextEditingController();
    }
  }



  void goBack() {
    Navigator.pop(context);
  }

  @override
  String getTag() {
    return "api_register_controller";
  }
}
