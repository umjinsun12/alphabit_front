import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'dart:convert';

import '../model/user_strategy_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AssetsController extends FxController {
  bool showLoading = true, uiLoading = true;
  List<UserStrategyData>? userStrategyDatas;

  dynamic userData;
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;
  int numPages = 7;

  late DateTime selectedDate;



  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    fetchData();
  }

  void fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    userData = json.decode(prefs.get('user').toString());
    userStrategyDatas = await UserStrategyData.getUserStrategyData();
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }


  void goBack() {
    Navigator.pop(context);
  }

  nextPage() async {
    if (currentPage == numPages) {
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => FullApp()));
    } else {
      await pageController.animateToPage(
        currentPage + 1,
        duration: Duration(milliseconds: 600),
        curve: Curves.ease,
      );
    }
  }

  Future<void> showCalendar() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      update();
    }
  }

  void previousPage() async {
    if (currentPage == 0) {
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => FullApp()));
    } else {
      await pageController.animateToPage(
        currentPage - 1,
        duration: Duration(milliseconds: 600),
        curve: Curves.ease,
      );
    }
  }

  onPageChanged(int page, {bool fromUser = false}) async {
    if (!fromUser) currentPage = page;
    update();
    if (fromUser) {
      await pageController.animateToPage(
        page,
        duration: Duration(milliseconds: 600),
        curve: Curves.ease,
      );
    }
  }

  @override
  String getTag() {
    return "assets_controller";
  }
}
