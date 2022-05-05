import 'dart:convert';

import 'package:alphabit_front/apps/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


Uri user_url = Uri.parse(SERVER_URL +"/users/me");

class UserStrategyData{
  String strategyName;
  String orderedCoin;
  String stock;
  double seedMoney;
  double capableMoney;
  double averagePrice;
  int pivot;
  int maxPivot;
  bool isActive;

  UserStrategyData({
    required this.strategyName,
    required this.orderedCoin,
    required this.stock,
    required this.seedMoney,
    required this.capableMoney,
    required this.averagePrice,
    required this.pivot,
    required this.maxPivot,
    required this.isActive
  });

  static Future<List<UserStrategyData>> getUserStrategyData() async {
    dynamic data = json.decode(await getUserData());
    return await UserStrategyData.getListFromJson(data['user_strategies']);
  }

  factory UserStrategyData.fromJson(Map<String, dynamic> jsonObject) {
    return UserStrategyData(
        strategyName: jsonObject['strategyName'].toString(),
        orderedCoin: jsonObject['orderedCoin'].toString(),
        stock: jsonObject['stock'].toString(),
        seedMoney: jsonObject['seedMoney'].toDouble(),
        capableMoney: jsonObject['capableMoney'].toDouble(),
        averagePrice: jsonObject['averagePrice'].toDouble(),
        pivot: jsonObject['pivot'],
        maxPivot: jsonObject['maxPivot'],
        isActive: jsonObject['isActive']
    );
  }

  static Future<List<UserStrategyData>> getListFromJson(List<dynamic> jsonArray) async{
    List<UserStrategyData> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      dynamic strategyData= json.decode(await getStrategyDatabyId(jsonArray[i]['strategyId']));
      jsonArray[i]['strategyName']=strategyData['strategyName'];
      list.add(UserStrategyData.fromJson(jsonArray[i]));
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
    if (response.statusCode == 200) {
      return response.body;
    }else
      return response.body;
  }

  static Future<dynamic> getStrategyDatabyId(int id) async {
    Map<String,String> headers = {
      'Content-Type':'application/json',
      'Accept': 'application/json',
    };
    Uri strategy_url = Uri.parse(SERVER_URL + "/strategies/" + id.toString());
    http.Response response = await http.get(strategy_url, headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    }else
      return response.body;
  }



  static Future<dynamic> _getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    dynamic userdata = json.decode(prefs.get('user').toString());
    return userdata;
  }



}