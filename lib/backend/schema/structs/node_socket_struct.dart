// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NodeSocketStruct extends BaseStruct {
  NodeSocketStruct({
    String? id,
    NFPointStruct? position,
    String? label,
    Color? color,
  })  : _id = id,
        _position = position,
        _label = label,
        _color = color;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "position" field.
  NFPointStruct? _position;
  NFPointStruct get position => _position ?? NFPointStruct();
  set position(NFPointStruct? val) => _position = val;

  void updatePosition(Function(NFPointStruct) updateFn) {
    updateFn(_position ??= NFPointStruct());
  }

  bool hasPosition() => _position != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  static NodeSocketStruct fromMap(Map<String, dynamic> data) =>
      NodeSocketStruct(
        id: data['id'] as String?,
        position: data['position'] is NFPointStruct
            ? data['position']
            : NFPointStruct.maybeFromMap(data['position']),
        label: data['label'] as String?,
        color: getSchemaColor(data['color']),
      );

  static NodeSocketStruct? maybeFromMap(dynamic data) => data is Map
      ? NodeSocketStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'position': _position?.toMap(),
        'label': _label,
        'color': _color,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'position': serializeParam(
          _position,
          ParamType.DataStruct,
        ),
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
      }.withoutNulls;

  static NodeSocketStruct fromSerializableMap(Map<String, dynamic> data) =>
      NodeSocketStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        position: deserializeStructParam(
          data['position'],
          ParamType.DataStruct,
          false,
          structBuilder: NFPointStruct.fromSerializableMap,
        ),
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'NodeSocketStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NodeSocketStruct &&
        id == other.id &&
        position == other.position &&
        label == other.label &&
        color == other.color;
  }

  @override
  int get hashCode => const ListEquality().hash([id, position, label, color]);
}

NodeSocketStruct createNodeSocketStruct({
  String? id,
  NFPointStruct? position,
  String? label,
  Color? color,
}) =>
    NodeSocketStruct(
      id: id,
      position: position ?? NFPointStruct(),
      label: label,
      color: color,
    );
