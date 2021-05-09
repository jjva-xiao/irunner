import 'package:flutter/material.dart';
import 'package:irunner/common/constant/color_helper.dart';

class BaseText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final bool bold;
  final bool softWrap;
  final bool medium;
  final bool heavy;
  final bool center;
  final int maxLines;
  final TextDecoration decoration;
  final double height;
  final TextStyle style;

  BaseText(this.text,
      {this.color,
        this.size,
        this.bold: false,
        this.heavy: false,
        this.softWrap: false,
        this.center: false,
        this.medium: false,
        this.maxLines,
        this.decoration,
        this.height, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: center ? TextAlign.center : TextAlign.start,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      softWrap: softWrap,
      style: style ?? TextStyle(
        decoration: decoration,
        color: color ?? ColorHelper.sixColor,
        fontSize: size ?? 14,
        fontWeight: heavy
            ? FontWeight.w900
            : (bold
            ? FontWeight.bold
            : (medium ? FontWeight.w500 : FontWeight.normal)),
        height: height ?? 1.4,
      ),
    );
  }
}