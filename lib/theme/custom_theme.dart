import 'dart:ui';

enum CustomThemeType { light, dark }

class CustomTheme {
  static final Color occur = Color(0xffb38220);
  static final Color red = Color(0xfff8575e);
  static final Color purple = Color(0xff9f50bf);
  static final Color peach = Color(0xffe09c5f);
  static final Color skyBlue = Color(0xff639fdc);
  static final Color darkGreen = Color(0xff226e79);
  static final Color pink = Color(0xffd17b88);
  static final Color brown = Color(0xffbd631a);
  static final Color blue = Color(0xff1a71bd);
  static final Color green = Color(0xff068425);

  final Color card,
      cardDark,
      border,
      borderDark,
      disabledColor,
      onDisabled,
      colorInfo,
      colorWarning,
      colorSuccess,
      colorError,
      shadowColor,
      onInfo,
      onWarning,
      onSuccess,
      onError;

  final Color shimmerBaseColor, shimmerHighlightColor;

  final Color lightBlack, yellow, orange, violet, indigo;

  //Pastel
  final Color lightPink,
      deepChampagne,
      lemonYellowCrayola,
      teaGreen,
      celeste,
      babyBlueEyes,
      maximumBluePurple,
      mauve,
      babyPowder;

  // final Color onFrenchSkyBlue;

  final Color shoppingPrimary,
      shoppingOnPrimary,
      shoppingSecondary,
      shoppingOnSecondary;

  final Color learningPrimary,
      learningOnPrimary,
      learningCategory1,
      learningCategory2,
      learningCategory3,
      learningCategory4,
      learningCategory5,
      learningPlayIconColor;

  final Color fitnessPrimary,
      fitnessOnPrimary,
      magenta,
      oliveGreen,
      carolinaBlue;

  final Color foodPrimary,
  foodOnPrimary,
  foodSecondary,
  foodOnSecondary;

  CustomTheme({
    this.border = const Color(0xffeeeeee),
    this.borderDark = const Color(0xffe6e6e6),
    this.card = const Color(0xfff0f0f0),
    this.cardDark = const Color(0xfffefefe),
    this.disabledColor = const Color(0xffdcc7ff),
    this.onDisabled = const Color(0xffffffff),
    this.colorWarning = const Color(0xffffc837),
    this.colorInfo = const Color(0xffff784b),
    this.colorSuccess = const Color(0xff3cd278),
    this.shadowColor = const Color(0xff1f1f1f),
    this.onInfo = const Color(0xffffffff),
    this.onWarning = const Color(0xffffffff),
    this.onSuccess = const Color(0xffffffff),
    this.colorError = const Color(0xfff0323c),
    this.onError = const Color(0xffffffff),

    //Shimmer (Loading Effect Color)
    this.shimmerBaseColor = const Color(0xFFF5F5F5),
    this.shimmerHighlightColor = const Color(0xFFE0E0E0),

    //Color
    this.lightBlack = const Color(0xffa7a7a7),
    this.yellow = const Color(0xfffff44f),
    this.orange = const Color(0xffFFA500),
    this.indigo = const Color(0xff4B0082),
    this.violet = const Color(0xff9400D3),

    //Pastel
    this.lightPink = const Color(0xffFFADAD),
    this.deepChampagne = const Color(0xffffd6a5),
    this.lemonYellowCrayola = const Color(0xfffdffb6),
    this.teaGreen = const Color(0xffCAFFBF),
    this.celeste = const Color(0xff9BF6FF),
    this.babyBlueEyes = const Color(0xffA0C4FF),
    this.maximumBluePurple = const Color(0xffBDB2FF),
    this.mauve = const Color(0xffFFC6FF),
    this.babyPowder = const Color(0xffFFFFFC),

    //Shopping Primary
    this.shoppingPrimary = const Color(0xff387D94),
    this.shoppingOnPrimary = const Color(0xffFAF9F9),
    this.shoppingSecondary = const Color(0xffD2E7EE),
    this.shoppingOnSecondary = const Color(0xff387D94),

    //Fitness Primary
    this.fitnessPrimary = const Color(0xff2D72F0),
    this.fitnessOnPrimary = const Color(0xffFAF9F9),
    this.magenta = const Color(0xff8B5587),
    this.oliveGreen = const Color(0xff4aa359),
    this.carolinaBlue = const Color(0xff069DEF),

    //Learning Primary
    this.learningPrimary = const Color(0xff6874E8),
    this.learningOnPrimary = const Color(0xffFDF6ED),
    this.learningCategory1 = const Color(0xff46A4E4),
    this.learningCategory2 = const Color(0xffEC84B5),
    this.learningCategory3 = const Color(0xffD28638),
    this.learningCategory4 = const Color(0xff16a058),
    this.learningCategory5 = const Color(0xffe55d27),
    this.learningPlayIconColor = const Color(0xffF57D32),

    //Food Primary
    this.foodPrimary = const Color(0xffF2894F),
    this.foodOnPrimary = const Color(0xffffffff),
    this.foodSecondary = const Color(0xff462F4D),
    this.foodOnSecondary = const Color(0xffffffff),

  });

  static CustomTheme lightCustomAppTheme = CustomTheme(
      card: Color(0xfff6f6f6),
      cardDark: Color(0xffffffff),
      disabledColor: Color(0xff636363),
      onDisabled: Color(0xffffffff),
      colorInfo: Color(0xffff784b),
      colorWarning: Color(0xffffc837),
      colorSuccess: Color(0xff3cd278),
      shadowColor: Color(0xffd9d9d9),
      onInfo: Color(0xffffffff),
      onSuccess: Color(0xffffffff),
      onWarning: Color(0xffffffff),
      colorError: Color(0xfff0323c),
      onError: Color(0xffffffff),
      shimmerBaseColor: Color(0xFFF5F5F5),
      shimmerHighlightColor: Color(0xFFE0E0E0));

  static CustomTheme darkCustomAppTheme = CustomTheme(
    card: Color(0xff222327),
    cardDark: Color(0xff121212),
    border: Color(0xff262626),
    borderDark: Color(0xff303030),
    disabledColor: Color(0xffbababa),
    onDisabled: Color(0xff000000),
    colorInfo: Color(0xffff784b),
    colorWarning: Color(0xffffc837),
    colorSuccess: Color(0xff3cd278),
    shadowColor: Color(0xff202020),
    onInfo: Color(0xffffffff),
    onSuccess: Color(0xffffffff),
    onWarning: Color(0xffffffff),
    colorError: Color(0xfff0323c),
    onError: Color(0xffffffff),
    shimmerBaseColor: Color(0xFF1a1a1a),
    shimmerHighlightColor: Color(0xFF454545),
  );

  static CustomThemeType defaultThemeType = CustomThemeType.light;

  static CustomTheme getCustomAppTheme({CustomThemeType? themeType}) {
    if (themeType == null) {
      themeType = defaultThemeType;
    }

    switch (themeType) {
      case CustomThemeType.light:
        return lightCustomAppTheme;
      default:
        return darkCustomAppTheme;
    }
  }

  static void changeLightTheme(CustomTheme themeData) {
    lightCustomAppTheme = themeData;
  }

  static void changeDarkTheme(CustomTheme themeData) {
    darkCustomAppTheme = themeData;
  }

  static void changeThemeType(CustomThemeType? themeType) {
    defaultThemeType = themeType!;
  }
}
