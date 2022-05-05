//import 'package:alphabit/apps/fitness/views/notice_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:url_launcher/url_launcher.dart';

//import '../views/S.dart';

class SettingsController extends FxController {
  bool showLoading = true, uiLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void goBack() {
    Navigator.pop(context);
  }

  void goToSubscription() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => SubscriptionScreen(),
    //   ),
    // );
  }

  void goToNoticeMenu(String _targeturl) {
    _launchURL(_targeturl);
  }

  void logout() {
    Navigator.pop(context);
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  String getTag() {
    return "settings_controller";
  }
}
