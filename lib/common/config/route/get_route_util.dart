
import 'package:get/get.dart';
import 'package:irunner/common/constant/route_helper.dart';
import 'package:irunner/module/start/splash_view.dart';

class GetRouteUtil {

  static const INITIAL = RouteHelper.SPLASH;

  static final routes = [
    GetPage(
      name: RouteHelper.SPLASH,
      page: () => SplashView(),
      // binding: SplashBinding(),
    ),
 /*   GetPage(
      name: RouteHelper.AUTH,
      page: () => AuthScreen(),
      binding: AuthBinding(),
      children: [
        GetPage(name: Routes.REGISTER, page: () => RegisterScreen()),
        GetPage(name: Routes.LOGIN, page: () => LoginScreen()),
      ],
    ),
    GetPage(
      name: RouteHelper.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
      children: [
        GetPage(name: Routes.CARDS, page: () => CardsScreen()),
      ]
    ),*/
  ];
}