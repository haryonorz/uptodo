import 'package:flutter/material.dart';

class Menu {
  final String iconPath;
  final String title;
  final Function() onTap;
  final Color? menuColor;
  final bool showTrailing;

  Menu({
    required this.iconPath,
    required this.title,
    required this.onTap,
    this.menuColor,
    this.showTrailing = true,
  });
}
