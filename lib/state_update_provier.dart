import 'package:flutter/cupertino.dart';

class StateUpdateProvider extends ChangeNotifier {
  updateState() {
    notifyListeners();
  }
}