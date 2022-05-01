import 'package:alphabit_front/apps/constant.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

Uri url = Uri.parse(SERVER_URL + "/auth/local");

class User {
  String id;
  String username;
  String email;
  String jwt;
  String activeMoney;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.jwt,
    required this.activeMoney
  });

  static Future<User> getUserData(_email, _password) async {
    print(_email);
    print(_password);
    dynamic data = json.decode(await getData(_email, _password));
    print(data['jwt']);
    return User.fromJson(data);
  }

  factory User.fromJson(Map<String, dynamic> jsonObject) {
    return User(
        id: jsonObject['user']['id'].toString(),
        username: jsonObject['user']['username'].toString(),
        email: jsonObject['user']['email'].toString(),
        jwt: jsonObject['jwt'].toString(),
        activeMoney: jsonObject['user']['activeMoney'].toString()
    );
  }

  static Future<dynamic> getData(_email, _password) async {
    Map<String,String> headers = {
      'Content-Type':'application/json'};

    print(url);

    http.Response response = await http.post(url,
        body: {'identifier': _email, 'password': _password});
    print(_email);
    print(_password);
    if (response.statusCode == 200) {
      _storeUserData(json.decode(response.body));
      return response.body;
    }else
      print(response.statusCode);
  }

  static Future<void> _storeUserData(responseData) async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> user = responseData['user'];
    user.putIfAbsent('jwt', () => responseData['jwt']);
    prefs.setString('user', json.encode(user));
  }

}