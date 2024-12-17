import 'package:flutter/material.dart';
import 'package:kumbh_mela_scanner/utils/colors.dart';

import 'text_widget.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final double fontSize;
  final double borderRadius;
  final Color textColor;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final double width;
  final Color buttonColor;
  final Color borderColor;
  final onTap;
  final EdgeInsets padding;
  final EdgeInsets margin;

  const CustomButton(
      {Key? key,
      this.label = '',
      this.fontSize = 15,
      this.borderRadius = 30,
      this.textColor = CustomColors.white,
      this.textAlign = TextAlign.center,
      this.fontWeight = FontWeight.w500,
      this.fontStyle = FontStyle.normal,
      required this.width,
      this.buttonColor = CustomColors.brandeisblue,
      this.borderColor = CustomColors.brandeisblue,
      this.onTap,
      this.padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      this.margin = const EdgeInsets.symmetric(horizontal: 15, vertical: 10)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            margin: margin,
            width: width,
            padding: padding,
            decoration: BoxDecoration(
                color: buttonColor,
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
            child: TextWidget(
                label: label,
                textAlign: textAlign,
                textColor: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight)));
  }
}