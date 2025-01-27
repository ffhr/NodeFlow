// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFSocketStruct extends BaseStruct {
  NFSocketStruct({
    String? id,
    Color? color,
    String? label,
  })  : _id = id,
        _color = color,
        _label = label;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  static NFSocketStruct fromMap(Map<String, dynamic> data) => NFSocketStruct(
        id: data['id'] as String?,
        color: getSchemaColor(data['color']),
        label: data['label'] as String?,
      );

  static NFSocketStruct? maybeFromMap(dynamic data) =>
      data is Map ? NFSocketStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'color': _color,
        'label': _label,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
      }.withoutNulls;

  static NFSocketStruct fromSerializableMap(Map<String, dynamic> data) =>
      NFSocketStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NFSocketStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFSocketStruct &&
        id == other.id &&
        color == other.color &&
        label == other.label;
  }

  @override
  int get hashCode => const ListEquality().hash([id, color, label]);
}

NFSocketStruct createNFSocketStruct({
  String? id,
  Color? color,
  String? label,
}) =>
    NFSocketStruct(
      id: id,
      color: color,
      label: label,
    );
