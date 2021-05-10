// import 'package:dio/dio.dart';
//
// class DioConfig {
//   static Dio createDefaultDio() {
//     String strConfig = StorageManager.sharedPreferences.getString('config');
//     if (null != strConfig) {
//       Map configMap = json.decode(strConfig);
//       Config.ip = configMap['ip'];
//       Config.port = int.parse(configMap['port']);
//       Config.userCode = configMap['userCode'];
//     }
//     Config.fresh();
//     Dio dio = Dio();
//     dio.options.baseUrl = Config.baseUrl;
//     dio.options.connectTimeout = 1000 * 30;
//     dio.options.receiveTimeout = 1000 * 30;
//     dio.options.contentType = Headers.jsonContentType;
//     dio.options.headers['channel'] = Platform.isAndroid ? 'android' : 'ios';
//     if (null != Config.token)
//       dio.options.headers['X-Access-Token'] = Config.token;
//     // dio.interceptors.add(ApiInterceptor());
//     if (!kReleaseMode)
//       (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
//           client.findProxy = (uri) {
//             return 'PROXY 192.168.31.124:8866';
//           };
// /*          client.findProxy = (url) {
//             return 'PROXY 192.168.1.2:8866';
//           };*/
//       };
//     // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
//     //   debugPrint('config proxy');
//     // }
//     return dio;
//   }
// }