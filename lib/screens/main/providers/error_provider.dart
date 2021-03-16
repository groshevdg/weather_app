import 'package:flutter/cupertino.dart';
import 'package:weather_app/config/strings.dart';

class ErrorMessageProvider extends ChangeNotifier {
  String _message = "";
  String get errorMessage => _message;

  void updateErrorMessage() {
    _message = Strings.add_city_error;
    notifyListeners();
  }

  void clearMessage() {
    _message = "";
    notifyListeners();
  }
}