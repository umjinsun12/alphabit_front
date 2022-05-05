import 'package:alphabit_front/apps/model/strategy_data.dart';
//import 'package:alphabit_front/apps/views/subscription_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class StrategyController extends FxController {
  StrategyData strategyData;
  StrategyController(this.strategyData);

  bool showLoading = true, uiLoading = true;

  @override
  void initState() {
    super.initState();
    super.save = false;
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void goBack() {
    Navigator.pop(context);
  }

  void goToSubscriptionScreen(){
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => SubscriptionScreen(),
    //   ),
    // );
  }

  @override
  String getTag() {
    return "statistics_controller";
  }
}
