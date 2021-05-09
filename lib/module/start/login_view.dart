import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';
import 'package:irunner/common/ui/base/base_app_bar.dart';
import 'package:irunner/module/start/map_test.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LeftTitleAppBar(title: '登录'),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      child: Column(
        children: [
          RaisedButton(
            onPressed: () async {
              List<Media> res = await ImagesPicker.pick(
                count: 3,
                pickType: PickType.image,
              );
            },
            child: Text('选择相册'),
          ),
          RaisedButton(
            onPressed: () {
              Get.to(MapTest());
            },
            child: Text('进入地图'),
          )
        ],
      ),
    );
  }

}
