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

  EdgeDrawingStruct _EdgeDrawing = EdgeDrawingStruct.fromSerializableMap(jsonDecode(
      '{\"drawing_start_point\":\"{\\\"position_x\\\":\\\"0\\\",\\\"position_y\\\":\\\"0\\\"}\",\"drawing_end_point\":\"{\\\"position_x\\\":\\\"0\\\",\\\"position_y\\\":\\\"0\\\"}\",\"drawing_state\":\"inactive\"}'));
  EdgeDrawingStruct get EdgeDrawing => _EdgeDrawing;
  set EdgeDrawing(EdgeDrawingStruct value) {
    _EdgeDrawing = value;
  }

  void updateEdgeDrawingStruct(Function(EdgeDrawingStruct) updateFn) {
    updateFn(_EdgeDrawing);
  }

  List<NodeStruct> _Nodes = [];
  List<NodeStruct> get Nodes => _Nodes;
  set Nodes(List<NodeStruct> value) {
    _Nodes = value;
  }

  void addToNodes(NodeStruct value) {
    Nodes.add(value);
  }

  void removeFromNodes(NodeStruct value) {
    Nodes.remove(value);
  }

  void removeAtIndexFromNodes(int index) {
    Nodes.removeAt(index);
  }

  void updateNodesAtIndex(
    int index,
    NodeStruct Function(NodeStruct) updateFn,
  ) {
    Nodes[index] = updateFn(_Nodes[index]);
  }

  void insertAtIndexInNodes(int index, NodeStruct value) {
    Nodes.insert(index, value);
  }

  int _NodeSelectedIndex = -1;
  int get NodeSelectedIndex => _NodeSelectedIndex;
  set NodeSelectedIndex(int value) {
    _NodeSelectedIndex = value;
  }

  NodeEdgeStruct _CurrentBuildingEdge = NodeEdgeStruct();
  NodeEdgeStruct get CurrentBuildingEdge => _CurrentBuildingEdge;
  set CurrentBuildingEdge(NodeEdgeStruct value) {
    _CurrentBuildingEdge = value;
  }

  void updateCurrentBuildingEdgeStruct(Function(NodeEdgeStruct) updateFn) {
    updateFn(_CurrentBuildingEdge);
  }

  List<NodeEdgeStruct> _Edges = [
    NodeEdgeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"e1\",\"source_node_id\":\"000001\",\"target_node_id\":\"000002\",\"source_output_socket_index\":\"1\",\"target_input_socket_index\":\"1\",\"color\":\"#000\"}'))
  ];
  List<NodeEdgeStruct> get Edges => _Edges;
  set Edges(List<NodeEdgeStruct> value) {
    _Edges = value;
  }

  void addToEdges(NodeEdgeStruct value) {
    Edges.add(value);
  }

  void removeFromEdges(NodeEdgeStruct value) {
    Edges.remove(value);
  }

  void removeAtIndexFromEdges(int index) {
    Edges.removeAt(index);
  }

  void updateEdgesAtIndex(
    int index,
    NodeEdgeStruct Function(NodeEdgeStruct) updateFn,
  ) {
    Edges[index] = updateFn(_Edges[index]);
  }

  void insertAtIndexInEdges(int index, NodeEdgeStruct value) {
    Edges.insert(index, value);
  }
}
