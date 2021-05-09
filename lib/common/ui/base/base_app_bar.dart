import 'package:flutter/material.dart';
import 'package:irunner/common/constant/size_helper.dart';

class LeftTitleAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;

  final bool hasBack;

  final bool isWhiteBack;

  final String right;

  final VoidCallback onTap;

  final Widget centerWidget;

  final Widget leading;

  final Color rightColor;

  final Widget rightWidget;

  final Color backgroundColor;

  final bool showDividerHorizontal;

  final Widget bottomWidget;

  final bool isCenterTitle;

  final double titleSize;

  final double height;

  bool canPop;

  LeftTitleAppBar(
      {Key key,
      this.backgroundColor,
      @required this.title,
      this.isWhiteBack = true,
      this.hasBack,
      this.right,
      this.onTap,
      this.centerWidget,
      this.rightColor,
      this.rightWidget,
      this.showDividerHorizontal = true,
      this.leading,
      this.bottomWidget,
      this.isCenterTitle: true,
      this.titleSize: 18.0,
      // this.height: 44.0,
      this.canPop,
      this.height: SizeHelper.APPBAR_HEIGHT})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
   // 是否是最后一个路由
   if (canPop == null)
      canPop = ModalRoute.of(context)?.canPop ?? false;
    return AppBar(
      elevation: 0.0,
      titleSpacing: 0.0,
      centerTitle: isCenterTitle,
      backgroundColor: backgroundColor,
    /*  actions: rightWidget != null
        ? [
            Padding(
              padding: EdgeInsets
            )
          ]*/
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
