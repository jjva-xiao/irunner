import 'dart:async';

import 'package:event_bus/event_bus.dart';

class EventBusManager {

  static EventBusManager _instance = EventBusManager._init();

  EventBus _eventBus;

  factory EventBusManager() => _instance;

  static EventBusManager getInstance() {
    return _instance;
  }

  EventBusManager._init() {
    if (null == _eventBus) {
      _eventBus = EventBus();
    }
  }
  
  StreamSubscription<T> listen<T extends Event>(Function(T event) data) {
    return _eventBus.on<T>().listen(data);
  }

  void sendEvent<T extends Event>(T event) {
    _eventBus.fire(event);
  }

}

abstract class Event {}