import 'package:alphabit_front/apps/view/api_register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/apikey_data.dart';

class ApiManagementController extends FxController{
  bool showLoading = true, uiLoading = true;
  List<ApikeyData>? apiKeydatas;

  List<IconData> icons = [
    Icons.directions_run,
    Icons.fitness_center,
    Icons.directions_bike,
  ];


  @override
  void initState() {
    super.initState();
    fetchData();
  }


  void fetchData() async {
    apiKeydatas = await ApikeyData.getApiKeyData();
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }



  void goToApiRegisterScreen(Function() refresh) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ApiRegisterScreen(),
      ),
    ).then((value)=> {
      refresh()
    });

  }

  @override
  String getTag() {
    return "analytics_controller";
  }

}
