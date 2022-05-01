import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:alphabit_front/images.dart';
import 'package:alphabit_front/theme/app_theme.dart';
import 'package:alphabit_front/theme/custom_theme.dart';

import '../controller/login_controller.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late LogInController controller;
  late OutlineInputBorder outlineInputBorder;

  String email = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    controller = FxControllerStore.putOrFind(LogInController());
    outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<LogInController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    return Scaffold(
      body: Padding(
        padding: FxSpacing.x(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FxText.h5(
              '알파비트 로그인',
              fontWeight: 700,
            ),
            FxSpacing.height(20),
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  TextFormField(
                    style: FxTextStyle.b2(),
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        isDense: true,
                        fillColor: customTheme.card,
                        prefixIcon: Icon(
                          FeatherIcons.mail,
                          color: theme.colorScheme.onBackground,
                        ),
                        hintText: "이메일",
                        enabledBorder: outlineInputBorder,
                        focusedBorder: outlineInputBorder,
                        border: outlineInputBorder,
                        contentPadding: FxSpacing.all(16),
                        hintStyle: FxTextStyle.b2(),
                        isCollapsed: true),
                    maxLines: 1,
                    controller: controller.emailTE,
                    validator: controller.validateEmail,
                    cursorColor: theme.colorScheme.onBackground,
                  ),
                  FxSpacing.height(20),
                  TextFormField(
                    style: FxTextStyle.b2(),
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        isDense: true,
                        fillColor: customTheme.card,
                        prefixIcon: Icon(
                          FeatherIcons.lock,
                          color: theme.colorScheme.onBackground,
                        ),
                        hintText: "비밀번호",
                        enabledBorder: outlineInputBorder,
                        focusedBorder: outlineInputBorder,
                        border: outlineInputBorder,
                        contentPadding: FxSpacing.all(16),
                        hintStyle: FxTextStyle.b2(),
                        isCollapsed: true),
                    maxLines: 1,
                    controller: controller.passwordTE,
                    validator: controller.validatePassword,
                    cursorColor: theme.colorScheme.onBackground,
                  ),
                ],
              ),
            ),
            FxSpacing.height(20),
            Align(
              alignment: Alignment.centerRight,
              child: FxButton.text(
                  onPressed: () {
                    controller.goToForgotPasswordScreen();
                  },
                  padding: FxSpacing.zero,
                  splashColor: customTheme.fitnessPrimary.withAlpha(40),
                  child: FxText.caption(
                    '비밀번호를 잊으셨나요 ?',
                    color: customTheme.fitnessPrimary,
                  )),
            ),
            FxSpacing.height(20),
            Row(
              children: [
                Expanded(
                  child: FxButton(
                    padding: FxSpacing.y(12),
                    onPressed: () {
                      controller.login();
                    },
                    backgroundColor: customTheme.fitnessPrimary,
                    elevation: 0,
                    borderRadiusAll: 4,
                    child: FxText.b2(
                      '로그인',
                      color: customTheme.fitnessOnPrimary,
                      fontWeight: 600,
                    ),
                  ),
                ),
              ],
            ),
            FxSpacing.height(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FxText.caption(
                  '새로운 회원이세요? ',
                ),
                FxButton.text(
                    onPressed: () {
                      controller.goToRegisterScreen();
                    },
                    padding: FxSpacing.zero,
                    splashColor: customTheme.fitnessPrimary.withAlpha(40),
                    child: FxText.caption(
                      '회원가입',
                      color: customTheme.fitnessPrimary,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
