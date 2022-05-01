
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
                            '암호화폐 오토트레이딩 서비스!',
                            fontWeight: 700,
                          ),
                          FxSpacing.height(16),
                          FxText.b2(
                            '알파비트에서 자동화 된 트레이딩 서비스를 해보세요.',
                            textAlign: TextAlign.center,
                          ),
                          FxSpacing.height(40),
                          FxButton.block(
                            onPressed: () {
                              print('sadfsdf');
                              controller.goToLogInScreen();
                            },
                            backgroundColor: customTheme.fitnessPrimary,
                            elevation: 0,
                            borderRadiusAll: 4,
                            child: FxText.button(
                              '시작하기',
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
