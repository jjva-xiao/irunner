import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseButton extends StatelessWidget {
  final double circular;
  final Color color;
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;
  final double fontSize;
  final String text;
  final VoidCallback onTap;
  final bool medium;
  final clickColor;
  final activedColor;
  final VoidCallback onLongPress;

  BaseButton({
    Key key,
    this.circular: 15,
    this.color,
    this.width,
    this.height,
    this.margin,
    this.fontSize,
    this.medium = false,
    @required this.text,
    @required this.onTap,
    this.clickColor,
    this.activedColor,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width ?? double.infinity,
      height: height ?? 120.h,
      child: RaisedButton(
        color: color,
        highlightColor: clickColor,
        shape: RoundedRectangleBorder(
          // side: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(circular))
        ),
        onPressed: onTap,
        onLongPress: onLongPress,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize ?? 16,
            fontWeight: medium ? FontWeight.w500 : FontWeight.normal
          ),
        )
      )
    );
  }

  void onPressInit() {

  }
}
