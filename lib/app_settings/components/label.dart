import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';

class Label extends StatelessWidget {
  const Label(
      {super.key,
      required this.txt,
      required this.type,
      this.forceAlignment = TextAlign.start,
      this.scale,
      this.forceColor = AppColors.blackColor});
  final String txt;
  final TextTypes type;
  final Color forceColor;
  final TextAlign forceAlignment;
  final TextScaler? scale;
  @override
  Widget build(BuildContext context) {
    return Text(txt,
        textScaler: scale,
        textAlign: forceAlignment,
        style: fontStyle(),
        softWrap: true);
  }

  TextStyle fontStyle() {
    FontWeight weight = FontWeight.normal;
    double size = 11.0;
    FontStyle fontStyle = FontStyle.normal;
    TextDecoration decoration = TextDecoration.none;
    switch (type) {
      case TextTypes.f_16_700:
        weight = FontWeight.w700;
        size = 16;
        decoration = TextDecoration.none;
        break;
      case TextTypes.f_32_900:
        weight = FontWeight.w900;
        size = 32;
        fontStyle = FontStyle.italic;
        decoration = TextDecoration.none;
        break;
      case TextTypes.f_18_600:
        weight = FontWeight.w600;
        size = 18;
        decoration = TextDecoration.none;
        break;
      case TextTypes.f_18_500:
        weight = FontWeight.w500;
        size = 18;
        decoration = TextDecoration.none;
        break;
      case TextTypes.f_16_500:
        weight = FontWeight.w500;
        size = 16;
        decoration = TextDecoration.none;
        break;
      case TextTypes.f_22_500:
        weight = FontWeight.w500;
        size = 22;
        decoration = TextDecoration.none;
        break;
      case TextTypes.f_20_500:
        weight = FontWeight.w500;
        size = 20;
        decoration = TextDecoration.none;
        break;
      case TextTypes.f_20_700:
        weight = FontWeight.w700;
        size = 20;
        decoration = TextDecoration.none;
        break;
      case TextTypes.f_12_500:
        weight = FontWeight.w500;
        size = 12;
        decoration = TextDecoration.none;
        break;
      case TextTypes.f_20_900:
        weight = FontWeight.w900;
        size = 20;
        decoration = TextDecoration.none;
        fontStyle = FontStyle.italic;
        break;
      case TextTypes.f_12_700:
        weight = FontWeight.w700;
        size = 12;
        decoration = TextDecoration.none;
        break;
      case TextTypes.f_10_500:
        weight = FontWeight.w500;
        size = 10;
        decoration = TextDecoration.none;
        break;
      case TextTypes.f_32_700:
        weight = FontWeight.w700;
        size = 32;
        decoration = TextDecoration.none;
        break;
      case TextTypes.f_15_500:
        weight = FontWeight.w500;
        size = 15;
        decoration = TextDecoration.none;
        break;
      case TextTypes.f_14_700:
        weight = FontWeight.w700;
        size = 14;
        decoration = TextDecoration.none;
        fontStyle = FontStyle.italic;
        break;
      case TextTypes.f_13_500:
        weight = FontWeight.w500;
        size = 13;
        decoration = TextDecoration.none;
        break;
      case TextTypes.f_14_500:
        weight = FontWeight.w500;
        size = 14;
        decoration = TextDecoration.none;
        break;
      case TextTypes.f_25_500:
        weight = FontWeight.w500;
        size = 25;
        decoration = TextDecoration.none;
        break;
      case TextTypes.f_13_700:
        weight = FontWeight.w700;
        size = 13;
        decoration = TextDecoration.none;
        break;
      case TextTypes.f_15_700:
        weight = FontWeight.w700;
        size = 15;
        decoration = TextDecoration.none;
        break;
      case TextTypes.f_40_700:
        weight = FontWeight.w700;
        size = 40;
        decoration = TextDecoration.none;
        break;
      case TextTypes.f_12_500i:
        weight = FontWeight.w500;
        size = 12;
        decoration = TextDecoration.none;
        fontStyle = FontStyle.italic;
        break;
      case TextTypes.f_12_900:
        weight = FontWeight.w900;
        size = 12;
        decoration = TextDecoration.none;
        break;
      case TextTypes.f_15_900:
        weight = FontWeight.w900;
        size = 15;
        decoration = TextDecoration.none;
        break;
      case TextTypes.f_20_500i:
        weight = FontWeight.w500;
        size = 20;
        decoration = TextDecoration.none;
        fontStyle = FontStyle.italic;
        break;
      case TextTypes.f_20_900i:
        weight = FontWeight.w900;
        size = 20;
        decoration = TextDecoration.none;
        fontStyle = FontStyle.italic;
        break;
    }

    return TextStyle(
        color: forceColor,
        fontFamily: AppConst.fontFamily,
        fontWeight: weight,
        fontStyle: fontStyle,
        decoration: decoration,
        fontSize: size);
  }
}

enum TextTypes {
  f_32_900,
  f_16_700,
  f_18_600,
  f_18_500,
  f_16_500,
  f_22_500,
  f_20_500,
  f_20_700,
  f_12_500,
  f_12_700,
  f_12_900,
  f_20_900,
  f_10_500,
  f_32_700,
  f_15_500,
  f_14_700,
  f_14_500,
  f_13_500,
  f_13_700,
  f_25_500,
  f_15_700,
  f_15_900,
  f_40_700,
  f_12_500i,
  f_20_500i,
  f_20_900i,
}
