import 'package:alphabit_front/apps/model/strategy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:alphabit_front/extensions/extensions.dart';
import 'package:alphabit_front/theme/app_theme.dart';
import 'package:alphabit_front/theme/custom_theme.dart';
import 'package:alphabit_front/widgets/custom/loading_effect.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controller/strategy_controller.dart';


class StrategysScreen extends StatefulWidget {
  final StrategyData strategyData;

  StrategysScreen(this.strategyData, {Key? key}) : super(key:key);

  @override
  _StrategysScreenState createState() => _StrategysScreenState();
}

class _StrategysScreenState extends State<StrategysScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late StrategyController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    controller = FxControllerStore.putOrFind(
        StrategyController(widget.strategyData)
    );
  }

  Widget _buildSignalList(){
    List<Widget> list = [];
    list.add(FxSpacing.width(20));

    for(dynamic strategyData in controller.strategyData.tradeSignals){
      String sideString = '';
      Color sideColor=customTheme.fitnessPrimary.withAlpha(28);
      if(strategyData['side']=='buy'){
        sideString='매수';
      }else{
        sideString='매도';
        sideColor=customTheme.colorError.withAlpha(28);
      }

      list.add(
          FxContainer(
            borderRadiusAll: 4,
            padding: FxSpacing.all(20),
            color: sideColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText.button(
                      sideString,
                      xMuted: true,
                      letterSpacing: 0.3,
                    ),
                    FxSpacing.height(6),
                    FxText.b1(
                      strategyData['price'].toString()+'원',
                      fontWeight: 700,
                    ),
                  ],
                ),
              ],
            ),
          )
      );
    }

    return Column(
      children: list,
    );
  }


  @override
  Widget build(BuildContext context) {
    return FxBuilder<StrategyController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: Padding(
          padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
          child:
          LoadingEffect.getSearchLoadingScreen(context, theme, customTheme),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              controller.goBack();
            },
            child: Icon(
              Icons.chevron_left,
              size: 20,
            ),
          ),
          title: FxText.sh1(
            "전략상세",
            color: theme.colorScheme.onBackground,
            fontWeight: 600,
          ),
        ),
        body: Column(
          children: [
            FxSpacing.height(24),

            FxSpacing.height(20),
            FxText.h5(
              controller.strategyData.name + ' 전략',
              fontWeight: 700,
            ),
            FxSpacing.height(4),
            FxText.caption(
              '업비트',
              xMuted: true,
            ),
            FxSpacing.height(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    FxText.b2(
                      '1230' + '%',
                      fontWeight: 600,
                    ),
                    FxSpacing.height(4),
                    FxText.caption(
                      '3년 수익률',
                      xMuted: true,
                    ),
                  ],
                ),
                Column(
                  children: [
                    FxText.b2(
                      '51' + '%',
                      fontWeight: 600,
                    ),
                    FxSpacing.height(4),
                    FxText.caption(
                      '1년 수익률',
                      xMuted: true,
                    ),
                  ],
                ),
                Column(
                  children: [
                    FxText.b2(
                      '10' + '%',
                      fontWeight: 600,
                    ),
                    FxSpacing.height(4),
                    FxText.caption(
                      '6개월 수익률',
                      xMuted: true,
                    ),
                  ],
                ),
              ],
            ),
            FxSpacing.height(15),
            FxContainer(
              borderRadiusAll: 4,
              padding: FxSpacing.x(20),
              color: customTheme.fitnessPrimary.withAlpha(0),
              child: FxButton.block(
                padding: FxSpacing.y(12),
                elevation: 0,
                borderRadiusAll: 4,
                backgroundColor: customTheme.fitnessPrimary,
                onPressed: () {
                  //controller.goToApiRegisterScreen(refresh);
                  controller.goToSubscriptionScreen();
                  print('test');
                },
                child: FxText.b2(
                  '구독하기',
                  color: customTheme.fitnessOnPrimary,
                ),
              ),
            ),
            FxSpacing.height(15),
            FxSpacing.height(15),
            FxText.b1(
              '매매 내역',
              fontWeight: 600,
              color: theme.colorScheme.onBackground,
            ),
            FxSpacing.height(16),
            Expanded(
                child : SingleChildScrollView(
                  child : _buildSignalList(),
                )
            )
          ],
        ),
      );
    }
  }
}
