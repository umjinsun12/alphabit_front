import 'package:alphabit_front/apps/model/strategy_data.dart';
import 'package:alphabit_front/apps/view/api_register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../view/strategy_screen.dart';



class HomeController extends FxController {
  bool showLoading = true, uiLoading = true;
  List<StrategyData>? strategies;


  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    strategies = await StrategyData.getStrategyList();
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void goToSubscriptionScreen() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => SubscriptionScreen(),
    //   ),
    // );
  }

  void goToApiRegisterScreen(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ApiRegisterScreen(),
      ),
    );
  }

  void goToStrategyScreen(strategyData) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StrategysScreen(strategyData),
      ),
    );
  }

  @override
  String getTag() {
    return "home_controller";
  }
}
