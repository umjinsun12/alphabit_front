
import 'package:alphabit_front/apps/controller/splash_controller.dart';
import 'package:alphabit_front/theme/app_notifier.dart';
import 'package:alphabit_front/theme/app_theme.dart';
import 'package:alphabit_front/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:provider/provider.dart';

import '../../images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late SplashController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    FxControllerStore.resetStore();
    controller = FxControllerStore.putOrFind(SplashController());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
        builder: (BuildContext context, AppNotifier value, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // debugShowMaterialGrid: true,
            theme: theme.copyWith(
                colorScheme: theme.colorScheme
                    .copyWith(secondary: customTheme.fitnessPrimary.withAlpha(40))),
            builder: (context, child) {
              print('dic!!!');
              return Directionality(
                  textDirection: AppTheme.textDirection, child: child!);
            },
            home: FxBuilder<SplashController>(
                controller: controller,
                builder: (controller) {
                  return Scaffold(
                    body: Padding(
                      padding: FxSpacing.x(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FxContainer(
                            height: 400,
                            width: 300,
                            color: customTheme.fitnessPrimary.withAlpha(30),
                            child: Image(
                              image: AssetImage(Images.fitnessSplash),
                            ),
                          ),
                          FxSpacing.height(24),
                          FxText.h5(
                            '???????????? ?????????????????? ?????????!',
                            fontWeight: 700,
                          ),
                          FxSpacing.height(16),
                          FxText.b2(
                            '?????????????????? ????????? ??? ???????????? ???????????? ????????????.',
                            textAlign: TextAlign.center,
                          ),
                          FxSpacing.height(40),
                          FxButton.block(
                            onPressed: () {
                              controller.goToLogInScreen();
                            },
                            backgroundColor: customTheme.fitnessPrimary,
                            elevation: 0,
                            borderRadiusAll: 4,
                            child: FxText.button(
                              '????????????',
                              fontWeight: 600,
                              color: customTheme.fitnessOnPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          );
        });
  }
}
