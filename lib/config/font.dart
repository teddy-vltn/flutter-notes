
// enum of text styles

import 'package:flutter/material.dart';

enum TextStyles {
  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
  bodyText1,
  bodyText2,
  subtitle1,
  subtitle2,
  caption,
  button,
  overline,
}

// enum of text styles
enum FontWeights {
  thin,
  extraLight,
  light,
  regular,
  medium,
  semiBold,
  bold,
  extraBold,
  black,
}

const commonFontFamily = 'Roboto';

// define map of text styles based on base font style and enum of text styles
const Map<TextStyles, TextStyle> textStyles = {
  TextStyles.h1: TextStyle(
    fontFamily: commonFontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  ),
  TextStyles.h2: TextStyle(
    fontFamily: commonFontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  ),
  TextStyles.h3: TextStyle(
    fontFamily: commonFontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  ),
  TextStyles.h4: TextStyle(
    fontFamily: commonFontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  TextStyles.h5: TextStyle(
    fontFamily: commonFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  ),
  TextStyles.h6: TextStyle(
    fontFamily: commonFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  ),
  TextStyles.bodyText1: TextStyle(
    fontFamily: commonFontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.3,
  ),
  TextStyles.bodyText2: TextStyle(
    fontFamily: commonFontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  TextStyles.subtitle1: TextStyle(
    fontFamily: commonFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  TextStyles.subtitle2: TextStyle(
    fontFamily: commonFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  ),
  TextStyles.caption: TextStyle(
    fontFamily: commonFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  ),
  TextStyles.button: TextStyle(
    fontFamily: commonFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  ),
  TextStyles.overline: TextStyle(
    fontFamily: commonFontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  ),
};

TextStyle getTextStyleWithColor(TextStyles textStyle, Color color) {
  return textStyles[textStyle]!.copyWith(color: color);
}


