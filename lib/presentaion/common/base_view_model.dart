import 'dart:async';

import 'package:flutter/foundation.dart';

abstract class BaseViewModelImpl implements BaseViewModel {
  StreamController<String> _errorEventsController;
  @override
  Stream<String> get errorEvents => _errorEventsController.stream;

  /// Only for child viewModels
  @override
  Sink<String> get errorEventsSink => _errorEventsController.sink;

  BaseViewModelImpl() {
    _errorEventsController = StreamController();
  }

  @override
  @mustCallSuper
  void dispose() {
    _errorEventsController.close();
  }
}

abstract class BaseViewModel {
  Stream<String> get errorEvents;
  Sink<String> get errorEventsSink;
  void dispose();
}
