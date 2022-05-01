import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:alphabit_front/theme/app_theme.dart';

extension IconExtension on Icon {
  Icon autoDirection() {
    if (AppTheme.textDirection == TextDirection.ltr) return this;
    if (this.icon == FeatherIcons.chevronRight) {
      return Icon(
        FeatherIcons.chevronLeft,
        color: this.color,
        textDirection: this.textDirection,
        size: this.size,
        key: this.key,
        semanticLabel: this.semanticLabel,
      );
    } else if (this.icon == FeatherIcons.chevronLeft) {
      return Icon(
        FeatherIcons.chevronRight,
        color: this.color,
        textDirection: this.textDirection,
        size: this.size,
        key: this.key,
        semanticLabel: this.semanticLabel,
      );
    }
    return this;
  }
}
