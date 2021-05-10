class StringUtil {
  StringUtil._();
  // 判断字符串为空或者空字符
  static bool isEmptyString(String str) {
    return str == null || str.isEmpty;
  }

}