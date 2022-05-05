import 'package:alphabit_front/apps/model/strategy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:alphabit_front/theme/app_theme.dart';
import 'package:alphabit_front/theme/custom_theme.dart';
import 'package:alphabit_front/widgets/custom/loading_effect.dart';

import '../../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late HomeController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    controller = FxControllerStore.putOrFind(HomeController());
  }


  refresh(){
    setState((){
      print('refresh');
    });
  }


  Widget _buildProductList() {
    List<Widget> list = [];

    list.add(FxSpacing.width(20));

    for(StrategyData strategyData in controller.strategies!){
      print(strategyData.release);
      if(strategyData.release == 'false'){
        continue;
      }
      list.add(FxContainer(
        borderRadiusAll: 4,
        padding: FxSpacing.xy(0, 16),
        margin: FxSpacing.nTop(20),
        onTap: (){
          controller.goToStrategyScreen(strategyData);
        },
        child: Row(
          children: [
            FxSpacing.width(20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FxText.b2(
                        strategyData.name,
                        fontSize: 17,
                        fontWeight: 700,
                      ),
                    ],
                  ),
                  FxSpacing.height(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          FxText.overline(
                            '총 수익률',
                            fontSize: 14,
                            fontWeight: 600,
                          ),
                          FxSpacing.height(4),
                          FxText.button(
                            '1239%',
                            fontSize: 17,
                            color: customTheme.colorSuccess,
                            fontWeight: 700,
                          ),
                        ],
                      ),
                      FxSpacing.width(10),
                      Column(
                        children: [
                          FxText.overline(
                            '거래수',
                            fontSize: 14,
                            fontWeight: 600,
                          ),
                          FxSpacing.height(4),
                          FxText.button(
                            '123',
                            fontSize: 17,
                            color: customTheme.colorSuccess,
                            fontWeight: 700,
                          ),
                        ],
                      ),
                      FxSpacing.width(10),
                      Column(
                        children: [
                          FxText.overline(
                            '최대손실률',
                            fontSize: 14,
                            fontWeight: 600,
                          ),
                          FxSpacing.height(4),
                          FxText.button(
                            '23%',
                            fontSize: 17,
                            color: customTheme.colorSuccess,
                            fontWeight: 700,
                          ),
                        ],
                      ),
                    ],
                  ),

                  FxSpacing.height(10),
                  Row(
                    children: [
                      FxContainer(
                        borderRadiusAll: 2,
                        padding: FxSpacing.xy(8, 4),
                        color: customTheme.shoppingSecondary,
                        child: Row(
                          children: [
                            FxText.caption(
                              '업비트',
                              fontWeight: 600,
                              color: customTheme.shoppingOnSecondary,
                            ),
                          ],
                        ),
                      ),
                      FxSpacing.width(10),
                      FxContainer(
                        borderRadiusAll: 2,
                        padding: FxSpacing.xy(8, 4),
                        color: customTheme.shoppingSecondary,
                        child: Row(
                          children: [
                            FxText.caption(
                              '비트코인',
                              fontWeight: 600,
                              color: customTheme.shoppingOnSecondary,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ));
    }



    return Column(
      children: list,
    );
  }


  @override
  Widget build(BuildContext context) {
    return FxBuilder<HomeController>(
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
          ));
    } else {
      return Scaffold(
        body: ListView(
          padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
          children: [
            Container(
              padding: FxSpacing.x(20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.b2(
                          '안녕하세요, 회원님',
                          muted: true,
                        ),
                        FxSpacing.height(8),
                        FxText.sh1(
                          '새로운 암호화폐 전략을 선택하세요.',
                          fontWeight: 700,
                          letterSpacing: 0.3,
                        ),
                      ],
                    ),
                  ),
                  FxSpacing.width(20),
                  InkWell(
                    onTap: () {},
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Icon(
                          FeatherIcons.bell,
                          color: theme.colorScheme.onBackground,
                          size: 20,
                        ),
                        Positioned(
                          top: -4,
                          right: -1,
                          child: FxContainer.rounded(
                            paddingAll: 3,
                            color: customTheme.fitnessPrimary,
                            child: Center(
                                child: FxText.caption(
                                  '2',
                                  color: customTheme.fitnessOnPrimary,
                                  fontSize: 8,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FxSpacing.height(20),
            FxContainer(
                borderRadiusAll: 4,
                onTap: () {
                  controller.goToApiRegisterScreen();
                },
                margin: FxSpacing.x(20),
                padding: FxSpacing.xy(20, 16),
                color: customTheme.fitnessPrimary.withAlpha(40),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FxText.b2(
                            "지금 거래소 API키를 등록하세요",
                            color: customTheme.fitnessPrimary,
                            fontWeight: 600,
                          )
                        ],
                      ),
                    ),
                    FxSpacing.width(20),
                    FxButton(
                      elevation: 0,
                      borderRadiusAll: 4,
                      onPressed: () {
                        controller.goToApiRegisterScreen();
                      },
                      splashColor: customTheme.fitnessOnPrimary.withAlpha(28),
                      backgroundColor: customTheme.fitnessPrimary,
                      child: FxText.button(
                        "등록하기",
                        color: customTheme.fitnessOnPrimary,
                        fontWeight: 600,
                      ),
                    )
                  ],
                )),
            FxSpacing.height(20),
            Container(
              padding: FxSpacing.x(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FxText.b2(
                    '전략 리스트',
                    fontWeight: 700,
                  )
                ],
              ),
            ),
            FxSpacing.height(20),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: _buildProductList(),
            ),
          ],
        ),
      );
    }
  }
}
