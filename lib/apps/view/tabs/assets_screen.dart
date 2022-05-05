import 'package:alphabit_front/apps/controller/assets_controller.dart';
import 'package:alphabit_front/apps/model/user_strategy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:alphabit_front/theme/app_theme.dart';
import 'package:alphabit_front/theme/custom_theme.dart';
import 'package:alphabit_front/widgets/custom/loading_effect.dart';
import 'package:intl/intl.dart';


class AssetsScreen extends StatefulWidget {
  const AssetsScreen({Key? key}) : super(key: key);
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<AssetsScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late AssetsController controller;

  static var f = NumberFormat.currency(locale: "ko_KR", symbol: "");

  @override
  void initState(){
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    controller = FxControllerStore.putOrFind(AssetsController());
  }





  Widget _billingWidget() {
    return FxContainer(
      borderRadiusAll: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxText.button(
            '내 투자 내역',
            muted: true,
            fontWeight: 700,
          ),
          FxSpacing.height(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FxText.b2(
                '총 자산',
                fontWeight: 700,
                fontSize: 15,
              ),
              FxText.b2(
                f.format(controller.userData['totalMoney']) + ' 원',
                fontWeight: 800,
                fontSize: 20,
              ),
            ],
          ),
          FxSpacing.height(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FxText.button(
                '운용자산',
                fontWeight: 600,
                fontSize: 15,
              ),
              FxText.button(
                f.format(controller.userData['activeMoney']) + ' 원',
                fontWeight: 700,
                fontSize: 15,
              ),
            ],
          ),
          FxSpacing.height(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FxText.button(
                '총 수익',
                fontWeight: 600,
                fontSize: 15,
              ),
              FxText.button(
                f.format(controller.userData['totalProfit']) + ' 원' +  '('+ controller.userData['totalProfitPercent'].toString() +'%)',
                fontWeight: 700,
                color: customTheme.colorSuccess,
                fontSize: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildUserStrategy(){

    List<Widget> tabs = [];


    for(UserStrategyData userStrategyData in controller.userStrategyDatas!){
      String isActive = userStrategyData.isActive ? '운용중' : '중지';
      tabs.add(FxContainer(
          borderRadiusAll: 4,
          padding: FxSpacing.all(20),
          margin : FxSpacing.fromLTRB(20, 0, 20, 0),
          color: customTheme.fitnessPrimary.withAlpha(28),
          child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.button(
                          '전략명',
                          xMuted: true,
                          letterSpacing: 0.3,
                        ),
                        FxSpacing.height(6),
                        FxText.b1(
                          userStrategyData.strategyName,
                          fontWeight: 700,
                        ),
                      ],
                    ),
                    FxSpacing.width(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.button(
                          '운용코인',
                          xMuted: true,
                          letterSpacing: 0.3,
                        ),
                        FxSpacing.height(6),
                        FxText.b1(
                          userStrategyData.orderedCoin,
                          fontWeight: 700,
                        ),
                      ],
                    ),
                    FxSpacing.width(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.button(
                          '거래소',
                          xMuted: true,
                          letterSpacing: 0.3,
                        ),
                        FxSpacing.height(6),
                        FxText.b1(
                          userStrategyData.stock,
                          fontWeight: 700,
                        ),
                      ],
                    ),
                  ],
                ),
                FxSpacing.height(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.button(
                          '운용자금',
                          xMuted: true,
                          letterSpacing: 0.3,
                        ),
                        FxSpacing.height(6),
                        FxText.b1(
                          f.format(userStrategyData.seedMoney) + ' 원',
                          fontWeight: 700,
                        ),
                      ],
                    ),
                    FxSpacing.width(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.button(
                          '현재 매수자금',
                          xMuted: true,
                          letterSpacing: 0.3,
                        ),
                        FxSpacing.height(6),
                        FxText.b1(
                          f.format(userStrategyData.seedMoney - userStrategyData.capableMoney) + ' 원',
                          fontWeight: 700,
                        ),
                      ],
                    ),
                    FxSpacing.width(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.button(
                          '',
                          xMuted: true,
                          letterSpacing: 0.3,
                        ),
                        FxSpacing.height(6),
                        FxText.b1(
                          '',
                          fontWeight: 700,
                        ),
                      ],
                    ),
                  ],
                ),
                FxSpacing.height(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.button(
                          '매수평단가',
                          xMuted: true,
                          letterSpacing: 0.3,
                        ),
                        FxSpacing.height(6),
                        FxText.b1(
                          f.format(userStrategyData.averagePrice) + ' 원',
                          fontWeight: 700,
                        ),
                      ],
                    ),
                    FxSpacing.width(5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.button(
                          '전략 수익률',
                          xMuted: true,
                          letterSpacing: 0.3,
                        ),
                        FxSpacing.height(6),
                        FxText.b1(
                          '1.2%',
                          fontWeight: 700,
                        ),
                      ],
                    ),
                    FxSpacing.width(5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.button(
                          '포지션',
                          xMuted: true,
                          letterSpacing: 0.3,
                        ),
                        FxSpacing.height(6),
                        FxText.b1(
                          '매수',
                          fontWeight: 700,
                        ),
                      ],
                    ),
                  ],
                ),
                FxSpacing.height(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.button(
                          '최대 매수/매도 횟수',
                          xMuted: true,
                          letterSpacing: 0.3,
                        ),
                        FxSpacing.height(6),
                        FxText.b1(
                          userStrategyData.maxPivot.toString(),
                          fontWeight: 700,
                        ),
                      ],
                    ),
                    FxSpacing.width(5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.button(
                          '매수/매도 횟수',
                          xMuted: true,
                          letterSpacing: 0.3,
                        ),
                        FxSpacing.height(6),
                        FxText.b1(
                          userStrategyData.pivot.toString(),
                          fontWeight: 700,
                        ),
                      ],
                    ),
                    FxSpacing.width(5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.button(
                          '상태',
                          xMuted: true,
                          letterSpacing: 0.3,
                        ),
                        FxSpacing.height(6),
                        FxText.b1(
                          isActive,
                          fontWeight: 700,
                        ),
                      ],
                    ),
                  ],
                ),
              ]
          )
      ));
    }

    return Column(
      children: tabs,
    );
  }


  @override
  Widget build(BuildContext context) {
    return FxBuilder<AssetsController>(
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
          automaticallyImplyLeading: false,
          title: FxText.b1(
            '자산',
            fontWeight: 700,
          ),
          centerTitle: true,
          elevation: 0,

        ),
        body: Container(
          padding: FxSpacing.fromLTRB(0, 8, 0, 0),
          child: ListView(
            children: [
              _billingWidget(),
              FxSpacing.height(20),
              Container(
                margin : FxSpacing.fromLTRB(20, 0, 20, 0),
                child :
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.b2(
                      '구독 전략 리스트',
                      fontWeight: 700,
                    )
                  ],
                ),
              ),
              FxSpacing.height(10),
              _buildUserStrategy()
            ],
          ),
        ),
      );
    }
  }
}
