/*
* File : Cupertino Time Picker
* Version : 1.0.0
* */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alphabit_front/theme/app_theme.dart';
import 'package:alphabit_front/theme/custom_theme.dart';

class CupertinoTimePickerScreen extends StatefulWidget {
  @override
  _CupertinoTimePickerScreenState createState() =>
      _CupertinoTimePickerScreenState();
}

class _CupertinoTimePickerScreenState extends State<CupertinoTimePickerScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time,
            onDateTimeChanged: (dateTime) {}));
  }
}
