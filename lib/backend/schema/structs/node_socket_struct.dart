// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NodeSocketStruct extends BaseStruct {
  NodeSocketStruct({
    String? id,
    String? label,
    Color? color,
    bool? isHover,
  })  : _id = id,
        _label = label,
        _color = color,
        _isHover = isHover;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

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

  // "is_hover" field.
  bool? _isHover;
  bool get isHover => _isHover ?? false;
  set isHover(bool? val) => _isHover = val;

  bool hasIsHover() => _isHover != null;

  static NodeSocketStruct fromMap(Map<String, dynamic> data) =>
      NodeSocketStruct(
        id: data['id'] as String?,
        label: data['label'] as String?,
        color: getSchemaColor(data['color']),
        isHover: data['is_hover'] as bool?,
      );

  static NodeSocketStruct? maybeFromMap(dynamic data) => data is Map
      ? NodeSocketStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'label': _label,
        'color': _color,
        'is_hover': _isHover,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
        'is_hover': serializeParam(
          _isHover,
          ParamType.bool,
        ),
      }.withoutNulls;

  static NodeSocketStruct fromSerializableMap(Map<String, dynamic> data) =>
      NodeSocketStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
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
        isHover: deserializeParam(
          data['is_hover'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'NodeSocketStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NodeSocketStruct &&
        id == other.id &&
        label == other.label &&
        color == other.color &&
        isHover == other.isHover;
  }

  @override
  int get hashCode => const ListEquality().hash([id, label, color, isHover]);
}

NodeSocketStruct createNodeSocketStruct({
  String? id,
  String? label,
  Color? color,
  bool? isHover,
}) =>
    NodeSocketStruct(
      id: id,
      label: label,
      color: color,
      isHover: isHover,
    );
