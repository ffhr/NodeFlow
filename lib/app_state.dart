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

  /// Current position of virtual 0,0 center in rendered NFZoomableStack
  NFOffsetStruct _NFViewportCenter = NFOffsetStruct.fromSerializableMap(
      jsonDecode('{\"offset_x\":\"0\",\"offset_y\":\"0\"}'));
  NFOffsetStruct get NFViewportCenter => _NFViewportCenter;
  set NFViewportCenter(NFOffsetStruct value) {
    _NFViewportCenter = value;
  }

  void updateNFViewportCenterStruct(Function(NFOffsetStruct) updateFn) {
    updateFn(_NFViewportCenter);
  }

  /// Current zoom/scale factor of currently visible NFDiagram in
  /// NFZoomableStack
  double _NFZoomFactor = 1.0;
  double get NFZoomFactor => _NFZoomFactor;
  set NFZoomFactor(double value) {
    _NFZoomFactor = value;
  }

  /// Current active state of building NFEdge on an active NFDiagram
  NFEdgeDrawingStateStruct _NFEdgeDrawingState =
      NFEdgeDrawingStateStruct.fromSerializableMap(jsonDecode(
          '{\"drawing_start_point\":\"{\\\"position_x\\\":\\\"0\\\",\\\"position_y\\\":\\\"0\\\"}\",\"drawing_end_point\":\"{\\\"position_x\\\":\\\"0\\\",\\\"position_y\\\":\\\"0\\\"}\",\"drawing_state\":\"wmsc1\"}'));
  NFEdgeDrawingStateStruct get NFEdgeDrawingState => _NFEdgeDrawingState;
  set NFEdgeDrawingState(NFEdgeDrawingStateStruct value) {
    _NFEdgeDrawingState = value;
  }

  void updateNFEdgeDrawingStateStruct(
      Function(NFEdgeDrawingStateStruct) updateFn) {
    updateFn(_NFEdgeDrawingState);
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

  /// Temporary edge data with an info between which NFInputSocket and
  /// NFOutputSocket is NFEdge building in NFDiagram
  NodeEdgeStruct _NFCurrentBuildingEdge = NodeEdgeStruct();
  NodeEdgeStruct get NFCurrentBuildingEdge => _NFCurrentBuildingEdge;
  set NFCurrentBuildingEdge(NodeEdgeStruct value) {
    _NFCurrentBuildingEdge = value;
  }

  void updateNFCurrentBuildingEdgeStruct(Function(NodeEdgeStruct) updateFn) {
    updateFn(_NFCurrentBuildingEdge);
  }

  List<NodeEdgeStruct> _Edges = [
    NodeEdgeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"\",\"source_node_id\":\"000001\",\"target_node_id\":\"000002\",\"source_output_socket_index\":\"1\",\"target_input_socket_index\":\"1\",\"color\":\"#000\"}'))
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

  double _DefaultZoomFactor = 100.0;
  double get DefaultZoomFactor => _DefaultZoomFactor;
  set DefaultZoomFactor(double value) {
    _DefaultZoomFactor = value;
  }

  NFGridType? _CurrentGridType = NFGridType.grid;
  NFGridType? get CurrentGridType => _CurrentGridType;
  set CurrentGridType(NFGridType? value) {
    _CurrentGridType = value;
  }
}
