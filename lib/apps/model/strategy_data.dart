import 'dart:convert';
import 'dart:ui';


import 'package:alphabit_front/apps/constant.dart';
import 'package:http/http.dart' as http;

Uri url = Uri.parse( SERVER_URL + "/strategies");

class StrategyData {
  String id, name, ticker, price, release;
  List<dynamic> tradeSignals;

  StrategyData(this.id ,this.name, this.ticker, this.price, this.release, this.tradeSignals);

  static Future<List<StrategyData>> getStrategyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<StrategyData> getOne() async {
    return (await getStrategyList())[0];
  }

  static StrategyData fromJson(Map<String, dynamic> jsonObject) {
    String id = jsonObject['id'].toString();
    String name = jsonObject['strategyName'].toString();
    String ticker = jsonObject['ticker'].toString();
    String price = jsonObject['price'].toString();
    String release = jsonObject['release'].toString();
    List<dynamic> tradeSignals = jsonObject['trade_signals'];

    return StrategyData(id, name, ticker, price, release, tradeSignals);
  }

  static List<StrategyData> getListFromJson(List<dynamic> jsonArray) {
    List<StrategyData> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(StrategyData.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<dynamic> getData() async {
    Map<String,String> headers = {
      'Content-Type':'application/json',
      'Accept': 'application/json'
    };
    print('response 1');
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }else
      print(response.statusCode);
  }
}
