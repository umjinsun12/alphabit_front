import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:alphabit_front/extensions/extensions.dart';
import 'package:alphabit_front/images.dart';
import 'package:alphabit_front/theme/app_theme.dart';
import 'package:alphabit_front/theme/custom_theme.dart';
import 'package:alphabit_front/widgets/custom/loading_effect.dart';

import 'package:alphabit_front/apps/controller/settings_controller.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late SettingsController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    controller = FxControllerStore.putOrFind(SettingsController());
  }

  Widget _buildSingleProfileInfo(String info, IconData iconData, bool isArrow, String infoType) {


    return GestureDetector(
      onTap: (){
        switch(infoType){
          case 'notice':
            controller.goToNoticeMenu('https://mixed-macrame-cd2.notion.site/19c38ebca1fa47c695ee7fe8ee8c1b3f');
            break;
          case 'terms':
            controller.goToNoticeMenu('https://mixed-macrame-cd2.notion.site/19c38ebca1fa47c695ee7fe8ee8c1b3f');
            break;
          default:
            print('pressed' + infoType);
        }
      },
      child: Padding(
        padding: FxSpacing.bottom(20),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 20,
              color: customTheme.fitnessPrimary,
            ),
            FxSpacing.width(20),
            Expanded(
                child: FxText.button(
                  info,
                )),
            FxSpacing.width(20),
            isArrow
                ? Icon(
              FeatherIcons.chevronRight,
              size: 20,
            ).autoDirection()
                : Container(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SettingsController>(
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
          title: FxText.b1(
            '설정',
            fontWeight: 700,
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: ListView(
          padding: FxSpacing.fromLTRB(
              20, FxSpacing.safeAreaTop(context), 20, 20),
          children: [
            _buildSingleProfileInfo('알림 설정', FeatherIcons.user, true, ""),
            _buildSingleProfileInfo('공지사항', FeatherIcons.award, true, "notice"),
            _buildSingleProfileInfo('이용약관', FeatherIcons.users, true, "terms"),
            _buildSingleProfileInfo(
                '개인정보 처리방침', FeatherIcons.shield, true, ""),
            _buildSingleProfileInfo(
                '문의하기', FeatherIcons.settings, true, ""),
            FxSpacing.height(20),
            FxButton.block(
              elevation: 0,
              borderRadiusAll: 4,
              backgroundColor: customTheme.fitnessPrimary.withAlpha(40),
              onPressed: () {
                controller.logout();
              },
              child: FxText.b2(
                '로그아웃',
                color: customTheme.fitnessPrimary,
              ),
            ),
          ],
        ),
      );
    }
  }
}
