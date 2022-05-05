import 'package:alphabit_front/apps/model/apikey_data.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:alphabit_front/extensions/extensions.dart';
import 'package:alphabit_front/theme/app_theme.dart';
import 'package:alphabit_front/theme/custom_theme.dart';
import 'package:alphabit_front/widgets/custom/loading_effect.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controller/analytics_controller.dart';

class AnalyticsScreen extends StatefulWidget {
  AnalyticsScreen({Key? key}) : super(key: key);

  @override
  _AnalyticsScreenState createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late AnalyticsController controller;



  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    controller = FxControllerStore.putOrFind(AnalyticsController());
  }


  refresh() {
    setState(() {
      print('refresh!!!');
      controller.fetchData();
    });
  }



  List<Widget> _buildApiKeyList() {
    List<Widget> list = [];

    list.add(FxSpacing.width(20));
    for(ApikeyData apiKeyData in controller.apiKeydatas!){
      list.add(
        FxContainer(
          borderRadiusAll: 4,
          padding: FxSpacing.all(20),
          color: customTheme.fitnessPrimary.withAlpha(28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.button(
                  '업비트',
                  xMuted: true,
                  letterSpacing: 0.3,
                ),
                FxSpacing.height(6),
                FxText.b1(
                  apiKeyData.publicKey,
                  fontWeight: 700,
                  fontSize: 13,
                ),
              ],
            )],
          ),
        ),
      );
      list.add(FxSpacing.height(20));
    }


    list.add(FxButton.block(
      padding: FxSpacing.y(12),
      elevation: 0,
      borderRadiusAll: 4,
      backgroundColor: customTheme.fitnessPrimary,
      onPressed: () {
        controller.goToApiRegisterScreen(refresh);
      },
      child: FxText.b2(
        'API키 등록',
        color: customTheme.fitnessOnPrimary,
      ),
    ));

    return list;
  }


  SfCartesianChart _buildSingleChart(Color color, List<SplineAreaData> data) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      margin: EdgeInsets.zero,
      primaryXAxis: NumericAxis(
          isVisible: false,
          interval: 1,
          majorGridLines: MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift),
      primaryYAxis: NumericAxis(
          isVisible: false,
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(size: 0)),
      series: controller.getAreaSeries(color, data),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<AnalyticsController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: Padding(
          padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 16),
          child:
          LoadingEffect.getSearchLoadingScreen(context, theme, customTheme),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: FxText.b1(
            'API 등록',
            fontWeight: 600,
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: ListView(
            padding: FxSpacing.fromLTRB(20, 8, 20, 0),
            children: _buildApiKeyList()
        ),
      );
    }
  }
}
