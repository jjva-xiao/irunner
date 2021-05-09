import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:irunner/module/start/login_view.dart';

class FlashView extends StatefulWidget {
  const FlashView({Key key}) : super(key: key);

  @override
  _FlashViewState createState() => _FlashViewState();
}

class _FlashViewState extends State<FlashView> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Get.off(LoginView());
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/images/flash.png',
        width: 1080.w,
        height: 1920.h,
        fit: BoxFit.fill,
      ),
    );
  }
}
