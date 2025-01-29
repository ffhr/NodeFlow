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

  double _NodeHeight = 150.0;
  double get NodeHeight => _NodeHeight;
  set NodeHeight(double value) {
    _NodeHeight = value;
  }

  NFPointStruct _DrawingStartPoint = NFPointStruct.fromSerializableMap(
      jsonDecode('{\"position_x\":\"0\",\"position_y\":\"0\"}'));
  NFPointStruct get DrawingStartPoint => _DrawingStartPoint;
  set DrawingStartPoint(NFPointStruct value) {
    _DrawingStartPoint = value;
  }

  void updateDrawingStartPointStruct(Function(NFPointStruct) updateFn) {
    updateFn(_DrawingStartPoint);
  }

  NFPointStruct _DrawingEndPoint = NFPointStruct.fromSerializableMap(
      jsonDecode('{\"position_x\":\"0\",\"position_y\":\"0\"}'));
  NFPointStruct get DrawingEndPoint => _DrawingEndPoint;
  set DrawingEndPoint(NFPointStruct value) {
    _DrawingEndPoint = value;
  }

  void updateDrawingEndPointStruct(Function(NFPointStruct) updateFn) {
    updateFn(_DrawingEndPoint);
  }

  bool _IsDrawingActive = false;
  bool get IsDrawingActive => _IsDrawingActive;
  set IsDrawingActive(bool value) {
    _IsDrawingActive = value;
  }

  NFOffsetStruct _ViewportCenter = NFOffsetStruct.fromSerializableMap(
      jsonDecode('{\"offset_x\":\"0\",\"offset_y\":\"0\"}'));
  NFOffsetStruct get ViewportCenter => _ViewportCenter;
  set ViewportCenter(NFOffsetStruct value) {
    _ViewportCenter = value;
  }

  void updateViewportCenterStruct(Function(NFOffsetStruct) updateFn) {
    updateFn(_ViewportCenter);
  }

  double _ZoomFactor = 1.0;
  double get ZoomFactor => _ZoomFactor;
  set ZoomFactor(double value) {
    _ZoomFactor = value;
  }
}
