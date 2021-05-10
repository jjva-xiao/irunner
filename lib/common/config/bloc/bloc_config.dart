import 'package:flutter/material.dart';

abstract class BaseBloc {
  void dispose(); // 用于及时销毁资源
}

class BaseBlocProvider<T extends BaseBloc> extends StatefulWidget {

  final T bloc;

  final Widget child;

  BaseBlocProvider({Key key, @required this.bloc, @required this.child}) : super(key: key);

  _BaseBlocProviderState createState() => _BaseBlocProviderState();

  static T of<T extends BaseBloc>(BuildContext context) {
    BaseBlocProvider provider = context.findAncestorWidgetOfExactType<BaseBlocProvider>();
    return provider.bloc;
  }
}

class _BaseBlocProviderState<T> extends State<BaseBlocProvider> {

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

}

