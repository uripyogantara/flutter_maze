import 'package:fazz_game/config/styles.dart';
import 'package:flutter/material.dart';

final ThemeData theme = _buildTheme();

ThemeData _buildTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    primaryColor: colorPrimary,
    accentColor: colorPrimary,
  );
}
