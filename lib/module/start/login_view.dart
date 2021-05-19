import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';
import 'package:irunner/common/ui/base/base_app_bar.dart';
import 'package:irunner/common/ui/base/base_button.dart';
import 'package:irunner/common/ui/base/base_text.dart';
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
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: _buildBody()
      )
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
              // Get.to(MapTest());
            },
            child: Text('进入地图'),
          ),
          _buildLogin(),
          _buildPasswd(),
          _buildLoginBtn()
        ],
      ),
    );
  }

  Widget _buildLogin() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Center(child: BaseText('账号'))
          ),
          Expanded(
            flex: 4,
            child: CupertinoTextField(
              style: TextStyle(fontSize: 28),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black38, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0),
            )
          )
        ],
      )
    );
  }

  Widget _buildPasswd() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Center(child: BaseText('密码'))
          ),
          Expanded(
            flex: 4,
            child: CupertinoTextField(
              style: TextStyle(fontSize: 28),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black38, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0),
            )
          )
        ],
      )
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      child: BaseButton(text: '登录', margin: EdgeInsets.symmetric(horizontal: 20.0), color: Colors.blueAccent, clickColor: Colors.red,  onTap: () {},)
    );
  }

  Widget _buildLoginMethod() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

      ],
    );
  }

  Widget _buildMethodButton() {
    return Container(
      child: ClipOval(
        child: Image.asset()
      ),
    );
  }
}
