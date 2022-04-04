import 'dart:async';

class MyController {
  static final myController = StreamController<bool>();

  static void emitValue(bool value) {
    myController.add(value);
  }
}
