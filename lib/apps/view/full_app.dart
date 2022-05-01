import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:alphabit_front/theme/app_theme.dart';
import 'package:alphabit_front/theme/custom_theme.dart';

import '../controller/full_app_controller.dart';
//import '../view/analytics_screen.dart';
import '../view/home_screen.dart';
//import '../view/profile_screen.dart';
//import '../view/schedule_screen.dart';

class FullApp extends StatefulWidget {
  const FullApp({Key? key}) : super(key: key);

  @override
  _FullAppState createState() => _FullAppState();
}

class _FullAppState extends State<FullApp> with SingleTickerProviderStateMixin {
  late ThemeData theme;
  late CustomTheme customTheme;

  late FullAppController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    controller = FxControllerStore.putOrFind(FullAppController(this));
  }

  List<Widget> buildTab() {
    List<Widget> tabs = [];

    for (int i = 0; i < controller.navItems.length; i++) {
      tabs.add(Container(
        child: (controller.currentIndex == i)
            ? Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              controller.navItems[i].iconData,
              size: 20,
              color: customTheme.fitnessPrimary,
            ),
            FxText.b2(controller.navItems[i].title,
                color: customTheme.fitnessPrimary,
                letterSpacing: 0,
                fontSize: 12,
                fontWeight: 600)
          ],
        )
            : Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              controller.navItems[i].iconData,
              size: 20,
              color: theme.colorScheme.onBackground,
            ),
            FxText.b2(controller.navItems[i].title,
                color: theme.colorScheme.onBackground,
                letterSpacing: 0,
                fontSize: 12,
                fontWeight: 400)
          ],
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<FullAppController>(
        controller: controller,
        builder: (controller) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: TabBarView(
                    physics: ClampingScrollPhysics(),
                    controller: controller.tabController,
                    children: <Widget>[
                      HomeScreen(),
                      //ScheduleScreen(),
                      //AnalyticsScreen(),
                      //ProfileScreen(),
                    ],
                  ),
                ),
                FxContainer.none(
                  padding: FxSpacing.xy(12, 25),
                  color: theme.scaffoldBackgroundColor,
                  bordered: true,
                  enableBorderRadius: false,
                  borderRadiusAll: 0,
                  border: Border(
                    top: BorderSide(width: 2, color: customTheme.border),
                  ),
                  child: TabBar(
                    controller: controller.tabController,
                    indicator: FxTabIndicator(
                        indicatorColor: customTheme.fitnessPrimary,
                        indicatorStyle: FxTabIndicatorStyle.rectangle,
                        indicatorHeight: 2,
                        radius: 4,
                        yOffset: -12,
                        width: 20),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: customTheme.fitnessPrimary,
                    tabs: buildTab(),
                  ),
                )
              ],
            ),
          );
        });
  }
}
