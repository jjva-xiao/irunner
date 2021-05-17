import 'dart:math';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:irunner/common/constant/path_helper.dart';

/// 应用自自带图片
// ignore: must_be_immutable
class ImageAsset extends StatelessWidget {
  final String asset; // 相对路径
  final double size; // 图片的尺寸
  final double width; // 宽度
  final double height; // 高度
  final BorderRadiusGeometry borderRadius; // 图片的圆角
  final double circular; //圆角大小
  final bool circle; //是否圆角
  final BoxFit fit; // 图片适配尺寸
  String path; // 绝对路径

  /// 默认设置覆盖图片的宽高比，路径默认
  ImageAsset(this.asset,
      {this.size,
      this.width,
      this.height,
      this.borderRadius,
      this.circular,
      this.circle: false,
      this.fit: BoxFit.cover,
      double minWidth}) {
    this.path = '${PathHelper.ASSET_PATH}$asset${PathHelper.IMAGE_EXTENSION}';
  }

  /// 如果图片载入失败，则使用错误提示图片作为占位图
  @override
  Widget build(BuildContext context) {
    return ExtendedImage.asset(
      path,
      width: size ?? width,
      height: size ?? height,
      borderRadius: borderRadius == null
          ? BorderRadius.all(Radius.circular(circular ?? 0))
          : borderRadius,
      shape: circle ? BoxShape.circle : BoxShape.rectangle,
      fit: fit,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.failed:
            double s = [size ?? width, size ?? height].reduce(min);
            return Container(
              alignment: Alignment.center,
              width: size ?? width,
              height: size ?? height,
              child: ImageAsset('image_fail', width: s, height: s),
            );
            break;
          default:
            return null;
            break;
        }
      },
    );
  }
}

/// 网络图片
class ImageNetwork extends StatelessWidget {
  final String url;
  final double size;
  final double width;
  final double height;
  final BorderRadiusGeometry borderRadius;
  final double circular;
  final bool circle;
  final BoxFit fit;
  final bool avatar;
  final bool isCompression; // 是否压缩
  final ExtendedImageMode mode; // 图片显示类型
  final double timeLimit;  // 超时时间
  final double timeRetry;  // 请求重试间隔
  final int retries;  // 重新请求的次数

  ImageNetwork(this.url,
      {this.size,
      this.width,
      this.height,
      this.borderRadius,
      this.circular,
      this.circle: false,
      this.fit: BoxFit.cover,
      this.avatar: false,
      this.isCompression: false,
      this.mode: ExtendedImageMode.none,
      this.timeLimit: 10.0,
      this.timeRetry: 1.0,
      this.retries: 1});

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      '$PathHelper.IMAGE_NET_PATH$url',
      width: size ?? width,
      height: size ?? height,
      borderRadius: borderRadius == null
          ? BorderRadius.all(Radius.circular(circular ?? 0))
          : borderRadius,
      shape: circle ? BoxShape.circle : BoxShape.rectangle,
      fit: fit,
      cache: true,
      mode: mode,
      // timeLimit: Duration(milliseconds: 1000 * timeLimit),
      // timeRetry: Duration(milliseconds: 1000 * timeRetry),
      retries: retries,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return Container(
              alignment: Alignment.center,
              width: size ?? width,
              height: size ?? height,
              child: ImageAsset(
                'image_fail',
                width: size ?? width,
                height: size ?? height,
              ),
            );
            break;
          case LoadState.failed:
            double s = [
              (size ?? width) ?? double.infinity,
              (size ?? height) ?? double.infinity
            ].reduce(min);
            return avatar
                ? ImageAsset('image_fail', size: size)
                : Container(
                    alignment: Alignment.center,
                    width: size ?? width,
                    height: size ?? height,
                    child: ImageAsset('image_fail', size: s),
                  );
            break;
          default:
            return null;
            break;
        }
      },
    );
  }
}