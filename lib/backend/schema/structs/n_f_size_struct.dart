// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFSizeStruct extends BaseStruct {
  NFSizeStruct({
    double? width,
    double? height,
  })  : _width = width,
        _height = height;

  // "width" field.
  double? _width;
  double get width => _width ?? 256.0;
  set width(double? val) => _width = val;

  void incrementWidth(double amount) => width = width + amount;

  bool hasWidth() => _width != null;

  // "height" field.
  double? _height;
  double get height => _height ?? 128.0;
  set height(double? val) => _height = val;

  void incrementHeight(double amount) => height = height + amount;

  bool hasHeight() => _height != null;

  static NFSizeStruct fromMap(Map<String, dynamic> data) => NFSizeStruct(
        width: castToType<double>(data['width']),
        height: castToType<double>(data['height']),
      );

  static NFSizeStruct? maybeFromMap(dynamic data) =>
      data is Map ? NFSizeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'width': _width,
        'height': _height,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'width': serializeParam(
          _width,
          ParamType.double,
        ),
        'height': serializeParam(
          _height,
          ParamType.double,
        ),
      }.withoutNulls;

  static NFSizeStruct fromSerializableMap(Map<String, dynamic> data) =>
      NFSizeStruct(
        width: deserializeParam(
          data['width'],
          ParamType.double,
          false,
        ),
        height: deserializeParam(
          data['height'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'NFSizeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFSizeStruct &&
        width == other.width &&
        height == other.height;
  }

  @override
  int get hashCode => const ListEquality().hash([width, height]);
}

NFSizeStruct createNFSizeStruct({
  double? width,
  double? height,
}) =>
    NFSizeStruct(
      width: width,
      height: height,
    );
