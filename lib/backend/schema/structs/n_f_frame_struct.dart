// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFFrameStruct extends BaseStruct {
  NFFrameStruct({
    NFPointStruct? point,
    NFSizeStruct? size,
  })  : _point = point,
        _size = size;

  // "point" field.
  NFPointStruct? _point;
  NFPointStruct get point => _point ?? NFPointStruct();
  set point(NFPointStruct? val) => _point = val;

  void updatePoint(Function(NFPointStruct) updateFn) {
    updateFn(_point ??= NFPointStruct());
  }

  bool hasPoint() => _point != null;

  // "size" field.
  NFSizeStruct? _size;
  NFSizeStruct get size => _size ?? NFSizeStruct();
  set size(NFSizeStruct? val) => _size = val;

  void updateSize(Function(NFSizeStruct) updateFn) {
    updateFn(_size ??= NFSizeStruct());
  }

  bool hasSize() => _size != null;

  static NFFrameStruct fromMap(Map<String, dynamic> data) => NFFrameStruct(
        point: data['point'] is NFPointStruct
            ? data['point']
            : NFPointStruct.maybeFromMap(data['point']),
        size: data['size'] is NFSizeStruct
            ? data['size']
            : NFSizeStruct.maybeFromMap(data['size']),
      );

  static NFFrameStruct? maybeFromMap(dynamic data) =>
      data is Map ? NFFrameStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'point': _point?.toMap(),
        'size': _size?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'point': serializeParam(
          _point,
          ParamType.DataStruct,
        ),
        'size': serializeParam(
          _size,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static NFFrameStruct fromSerializableMap(Map<String, dynamic> data) =>
      NFFrameStruct(
        point: deserializeStructParam(
          data['point'],
          ParamType.DataStruct,
          false,
          structBuilder: NFPointStruct.fromSerializableMap,
        ),
        size: deserializeStructParam(
          data['size'],
          ParamType.DataStruct,
          false,
          structBuilder: NFSizeStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'NFFrameStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFFrameStruct && point == other.point && size == other.size;
  }

  @override
  int get hashCode => const ListEquality().hash([point, size]);
}

NFFrameStruct createNFFrameStruct({
  NFPointStruct? point,
  NFSizeStruct? size,
}) =>
    NFFrameStruct(
      point: point ?? NFPointStruct(),
      size: size ?? NFSizeStruct(),
    );
