enum ViewState {
  loading,
  error,
  empty,
  content
}

class ViewStateEvent {

  String errMsg;

  bool isRefresh;

  ViewState state;

  ViewStateEvent({this.errMsg, this.isRefresh, this.state});
}

class BaseBloc {

}