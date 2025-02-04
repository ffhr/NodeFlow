// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NodeEdgeStruct extends BaseStruct {
  NodeEdgeStruct({
    String? id,
    String? sourceNodeId,
    String? targetNodeId,
    int? sourceOutputSocketIndex,
    int? targetInputSocketIndex,
    Color? color,
  })  : _id = id,
        _sourceNodeId = sourceNodeId,
        _targetNodeId = targetNodeId,
        _sourceOutputSocketIndex = sourceOutputSocketIndex,
        _targetInputSocketIndex = targetInputSocketIndex,
        _color = color;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "source_node_id" field.
  String? _sourceNodeId;
  String get sourceNodeId => _sourceNodeId ?? '';
  set sourceNodeId(String? val) => _sourceNodeId = val;

  bool hasSourceNodeId() => _sourceNodeId != null;

  // "target_node_id" field.
  String? _targetNodeId;
  String get targetNodeId => _targetNodeId ?? '';
  set targetNodeId(String? val) => _targetNodeId = val;

  bool hasTargetNodeId() => _targetNodeId != null;

  // "source_output_socket_index" field.
  int? _sourceOutputSocketIndex;
  int get sourceOutputSocketIndex => _sourceOutputSocketIndex ?? 0;
  set sourceOutputSocketIndex(int? val) => _sourceOutputSocketIndex = val;

  void incrementSourceOutputSocketIndex(int amount) =>
      sourceOutputSocketIndex = sourceOutputSocketIndex + amount;

  bool hasSourceOutputSocketIndex() => _sourceOutputSocketIndex != null;

  // "target_input_socket_index" field.
  int? _targetInputSocketIndex;
  int get targetInputSocketIndex => _targetInputSocketIndex ?? 0;
  set targetInputSocketIndex(int? val) => _targetInputSocketIndex = val;

  void incrementTargetInputSocketIndex(int amount) =>
      targetInputSocketIndex = targetInputSocketIndex + amount;

  bool hasTargetInputSocketIndex() => _targetInputSocketIndex != null;

  // "color" field.
  Color? _color;
  Color get color => _color ?? Colors.black;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  static NodeEdgeStruct fromMap(Map<String, dynamic> data) => NodeEdgeStruct(
        id: data['id'] as String?,
        sourceNodeId: data['source_node_id'] as String?,
        targetNodeId: data['target_node_id'] as String?,
        sourceOutputSocketIndex:
            castToType<int>(data['source_output_socket_index']),
        targetInputSocketIndex:
            castToType<int>(data['target_input_socket_index']),
        color: getSchemaColor(data['color']),
      );

  static NodeEdgeStruct? maybeFromMap(dynamic data) =>
      data is Map ? NodeEdgeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'source_node_id': _sourceNodeId,
        'target_node_id': _targetNodeId,
        'source_output_socket_index': _sourceOutputSocketIndex,
        'target_input_socket_index': _targetInputSocketIndex,
        'color': _color,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'source_node_id': serializeParam(
          _sourceNodeId,
          ParamType.String,
        ),
        'target_node_id': serializeParam(
          _targetNodeId,
          ParamType.String,
        ),
        'source_output_socket_index': serializeParam(
          _sourceOutputSocketIndex,
          ParamType.int,
        ),
        'target_input_socket_index': serializeParam(
          _targetInputSocketIndex,
          ParamType.int,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
      }.withoutNulls;

  static NodeEdgeStruct fromSerializableMap(Map<String, dynamic> data) =>
      NodeEdgeStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        sourceNodeId: deserializeParam(
          data['source_node_id'],
          ParamType.String,
          false,
        ),
        targetNodeId: deserializeParam(
          data['target_node_id'],
          ParamType.String,
          false,
        ),
        sourceOutputSocketIndex: deserializeParam(
          data['source_output_socket_index'],
          ParamType.int,
          false,
        ),
        targetInputSocketIndex: deserializeParam(
          data['target_input_socket_index'],
          ParamType.int,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'NodeEdgeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NodeEdgeStruct &&
        id == other.id &&
        sourceNodeId == other.sourceNodeId &&
        targetNodeId == other.targetNodeId &&
        sourceOutputSocketIndex == other.sourceOutputSocketIndex &&
        targetInputSocketIndex == other.targetInputSocketIndex &&
        color == other.color;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        sourceNodeId,
        targetNodeId,
        sourceOutputSocketIndex,
        targetInputSocketIndex,
        color
      ]);
}

NodeEdgeStruct createNodeEdgeStruct({
  String? id,
  String? sourceNodeId,
  String? targetNodeId,
  int? sourceOutputSocketIndex,
  int? targetInputSocketIndex,
  Color? color,
}) =>
    NodeEdgeStruct(
      id: id,
      sourceNodeId: sourceNodeId,
      targetNodeId: targetNodeId,
      sourceOutputSocketIndex: sourceOutputSocketIndex,
      targetInputSocketIndex: targetInputSocketIndex,
      color: color,
    );
