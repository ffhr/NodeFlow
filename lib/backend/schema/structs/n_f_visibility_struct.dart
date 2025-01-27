// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFVisibilityStruct extends BaseStruct {
  NFVisibilityStruct({
    bool? isVisible,
    double? opacity,
  })  : _isVisible = isVisible,
        _opacity = opacity;

  // "is_visible" field.
  bool? _isVisible;
  bool get isVisible => _isVisible ?? true;
  set isVisible(bool? val) => _isVisible = val;

  bool hasIsVisible() => _isVisible != null;

  // "opacity" field.
  double? _opacity;
  double get opacity => _opacity ?? 1.0;
  set opacity(double? val) => _opacity = val;

  void incrementOpacity(double amount) => opacity = opacity + amount;

  bool hasOpacity() => _opacity != null;

  static NFVisibilityStruct fromMap(Map<String, dynamic> data) =>
      NFVisibilityStruct(
        isVisible: data['is_visible'] as bool?,
        opacity: castToType<double>(data['opacity']),
      );

  static NFVisibilityStruct? maybeFromMap(dynamic data) => data is Map
      ? NFVisibilityStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'is_visible': _isVisible,
        'opacity': _opacity,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'is_visible': serializeParam(
          _isVisible,
          ParamType.bool,
        ),
        'opacity': serializeParam(
          _opacity,
          ParamType.double,
        ),
      }.withoutNulls;

  static NFVisibilityStruct fromSerializableMap(Map<String, dynamic> data) =>
      NFVisibilityStruct(
        isVisible: deserializeParam(
          data['is_visible'],
          ParamType.bool,
          false,
        ),
        opacity: deserializeParam(
          data['opacity'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'NFVisibilityStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFVisibilityStruct &&
        isVisible == other.isVisible &&
        opacity == other.opacity;
  }

  @override
  int get hashCode => const ListEquality().hash([isVisible, opacity]);
}

NFVisibilityStruct createNFVisibilityStruct({
  bool? isVisible,
  double? opacity,
}) =>
    NFVisibilityStruct(
      isVisible: isVisible,
      opacity: opacity,
    );
