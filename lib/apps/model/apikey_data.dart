import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../constant.dart';

Uri api_url = Uri.parse(SERVER_URL +"/user-api-keys");
Uri user_url = Uri.parse(SERVER_URL + "/users/me");

class ApikeyData {
  String id;
  String publicKey;
  String privateKey;
  String exchange;

  ApikeyData({
    required this.id,
    required this.publicKey,
    required this.privateKey,
    required this.exchange
  });

  static Future<List<ApikeyData>> getApiKeyData() async {
    dynamic data = json.decode(await getUserData());
    return ApikeyData.getListFromJson(data['user_api_keys']);
  }

  factory ApikeyData.fromJson(Map<String, dynamic> jsonObject) {
    return ApikeyData(
        id: jsonObject['id'].toString(),
        publicKey: jsonObject['apiKey'].toString(),
        privateKey: jsonObject['secretKey'].toString(),
        exchange: jsonObject['exchange'].toString()
    );
  }

  static List<ApikeyData> getListFromJson(List<dynamic> jsonArray) {
    List<ApikeyData> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(ApikeyData.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<dynamic> getUserData() async {
    dynamic userData = await _getUserData();
    Map<String,String> headers = {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      'Authorization' : 'Bearer ' + userData['jwt']
    };


    http.Response response = await http.get(user_url, headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    }else
      return response.body;
  }

  static Future<void> putApiKeyData(_publicKey, _privateKey, _exchange) async {
    dynamic userData = await _getUserData();
    Map<String,String> headers = {
      'Content-Type':'application/json',
      'Accept': 'application/json',
      'Authorization' : 'Bearer ' + userData['jwt']
    };
    dynamic body ={
      'apiKey' : _publicKey,
      'secretKey' : _privateKey,
      'exchange' : _exchange,
      'users_permissions_user' : userData['id']
    };
    http.Response response = await http.post(api_url, headers: headers, body:json.encode(body));
    if (response.statusCode == 200) {
      print('success');
    }else
      print('fail');
  }

  static Future<dynamic> _getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    dynamic userdata = json.decode(prefs.get('user').toString());
    return userdata;
  }

  static Future<void> _storeUserData(responseData) async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> user = responseData['user'];
    user.putIfAbsent('jwt', () => responseData['jwt']);
    prefs.setString('user', json.encode(user));
  }

}