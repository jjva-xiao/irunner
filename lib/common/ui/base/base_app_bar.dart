import 'package:flutter/material.dart';
import 'package:irunner/common/constant/color_helper.dart';
import 'package:irunner/common/constant/size_helper.dart';
import 'package:irunner/common/ui/base/base_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
   if (canPop == null)
      canPop = ModalRoute.of(context)?.canPop ?? false;
    return AppBar(
      elevation: 0.0,
      titleSpacing: 0.0,
      centerTitle: isCenterTitle,
      backgroundColor: backgroundColor,
      actions: rightWidget != null ?
        [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Center(
              child: rightWidget,
            ),
          )
        ]
        :
        [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: Align(
              child: Padding(
                padding: EdgeInsets.only(right: 16),
                child: BaseText(right ?? '',
                    color: rightColor ?? Colors.black),
              ),
            ),
          )
        ],
      leading: canPop
          ? leading ??
              IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: isWhiteBack ? Colors.white : ColorHelper.threeColor,
                    size: 22,
                  ),
                  onPressed: () => Navigator.pop(context))
          : Container(),
      title: BaseText(
        title ?? '',
        size: titleSize,
        color: isWhiteBack ? Colors.white : Colors.black,
      ),
      bottom: this.bottomWidget,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height.w);
}
