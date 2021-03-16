import 'package:flutter/foundation.dart';

class SendButtonStateProvider extends ChangeNotifier {
  ButtonState _currentState = ButtonState.sendArrow;
  ButtonState get currentState => _currentState;

  void updateButtonState(bool clicked) {
    if (clicked) {
      _currentState = ButtonState.progress;
    }
    else {
      _currentState = ButtonState.sendArrow;
    }

    notifyListeners();
  }
}

enum ButtonState {
  sendArrow,
  progress
}