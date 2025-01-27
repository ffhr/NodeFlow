import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  double _NodeWidth = 180.0;
  double get NodeWidth => _NodeWidth;
  set NodeWidth(double value) {
    _NodeWidth = value;
  }

  double _NodeHeight = 100.0;
  double get NodeHeight => _NodeHeight;
  set NodeHeight(double value) {
    _NodeHeight = value;
  }
}
