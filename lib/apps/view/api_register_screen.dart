import 'package:alphabit_front/apps/controller/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:alphabit_front/images.dart';
import 'package:alphabit_front/theme/app_theme.dart';
import 'package:alphabit_front/theme/custom_theme.dart';


class ApiRegisterScreen extends StatefulWidget {
  const ApiRegisterScreen({Key? key}) : super(key: key);

  @override
  _ApiRegisterScreenState createState() => _ApiRegisterScreenState();
}

class _ApiRegisterScreenState extends State<ApiRegisterScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late ApiController controller;
  late OutlineInputBorder outlineInputBorder;


  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    controller = FxControllerStore.putOrFind(ApiController());

    outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );


  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<ApiController>(
        controller: controller,
        builder: (controller) {
          return Scaffold(
            body: Padding(
              padding: FxSpacing.fromLTRB(
                  20, FxSpacing.safeAreaTop(context) + 20, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      controller.goBack();
                    },
                    child: Icon(
                      Icons.chevron_left,
                      size: 20,
                    ),
                  ),
                  FxSpacing.height(12),
                  FxText.h5(
                    '업비트 API키 신규 등록',
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
                              floatingLabelBehavior:
                              FloatingLabelBehavior.never,
                              filled: true,
                              isDense: true,
                              fillColor: customTheme.card,
                              hintText: "Public Key",
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                              contentPadding: FxSpacing.all(16),
                              hintStyle: FxTextStyle.b2(),
                              isCollapsed: true),
                          maxLines: 1,
                          controller: controller.publicKeyTE,
                          validator: controller.validatePublicKey,
                          cursorColor: theme.colorScheme.onBackground,
                        ),
                        FxSpacing.height(20),
                        TextFormField(
                          style: FxTextStyle.b2(),
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                              FloatingLabelBehavior.never,
                              filled: true,
                              isDense: true,
                              fillColor: customTheme.card,
                              hintText: "Private Key",
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                              contentPadding: FxSpacing.all(16),
                              hintStyle: FxTextStyle.b2(),
                              isCollapsed: true),
                          maxLines: 1,
                          controller: controller.privateKeyTE,
                          validator: controller.validatePrivateKey,
                          cursorColor: theme.colorScheme.onBackground,
                        ),
                      ],
                    ),
                  ),
                  FxSpacing.height(24),
                  Row(
                    children: [
                      Expanded(
                        child: FxButton(
                          padding: FxSpacing.y(12),
                          onPressed: () {
                            controller.register();
                          },
                          backgroundColor: customTheme.fitnessPrimary,
                          elevation: 0,
                          borderRadiusAll: 4,
                          child: FxText.b2(
                            '등록하기',
                            color: customTheme.fitnessOnPrimary,
                            fontWeight: 600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
