// import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:irunner/common/config/route/get_route_util.dart';
import 'package:irunner/common/constant/route_helper.dart';
import 'package:irunner/module/start/splash_view.dart';
import 'package:oktoast/oktoast.dart';

void main() {
  initApp();
}

Future<void> initApp() async {
  /*await AmapService.instance.init(
      iosKey: 'b7ec18a0be26da6a43455d359729e631',
      androidKey: '2bb446a6eda28d1a4d66dbddd321a5df');
  await enableFluttifyLog(false);*/
  // var binding = InnerWidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    return ScreenUtilInit(
      designSize: Size(1080, 1920),
      allowFontScaling: false,
      builder: () => OKToast(
        dismissOtherOnShow: true,
        backgroundColor: Color(0xFF3A3A3A),
        position: ToastPosition.bottom,
        radius: 2,
        textPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        textStyle: TextStyle(color: Colors.white, fontSize: 14),
        child: GetMaterialApp(
          title: '闪屏页',
          debugShowCheckedModeBanner: false,
          initialRoute: RouteHelper.SPLASH,
          enableLog: true,
          defaultTransition: Transition.fade,
          home: SplashView(),
          getPages: GetRouteUtil.routes,
          // onGenerateTitle: (context) {
          //   Locale locale = Localizations.localeOf(context);
          // },
        /*  routes: {
            '': (context) => FlashView()
          },
          initialRoute: '/',
          onGenerateRoute: (RouteSettings setting) {

          },*/
        )
      )
    );
  }
}
