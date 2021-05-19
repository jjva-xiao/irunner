import 'package:oktoast/oktoast.dart';

ToastFuture showToastCommon(
  String msg, {
  ToastPosition position,
}) {
  position ??= ToastPosition.center;
  return showToast(
    msg,
    position: position,
  );
}