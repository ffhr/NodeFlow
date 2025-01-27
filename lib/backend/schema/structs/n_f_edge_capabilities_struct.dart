// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFEdgeCapabilitiesStruct extends BaseStruct {
  NFEdgeCapabilitiesStruct({
    bool? isAnimated,
    bool? isDeletable,
    bool? isSelectable,
  })  : _isAnimated = isAnimated,
        _isDeletable = isDeletable,
        _isSelectable = isSelectable;

  // "is_animated" field.
  bool? _isAnimated;
  bool get isAnimated => _isAnimated ?? false;
  set isAnimated(bool? val) => _isAnimated = val;

  bool hasIsAnimated() => _isAnimated != null;

  // "is_deletable" field.
  bool? _isDeletable;
  bool get isDeletable => _isDeletable ?? true;
  set isDeletable(bool? val) => _isDeletable = val;

  bool hasIsDeletable() => _isDeletable != null;

  // "is_selectable" field.
  bool? _isSelectable;
  bool get isSelectable => _isSelectable ?? true;
  set isSelectable(bool? val) => _isSelectable = val;

  bool hasIsSelectable() => _isSelectable != null;

  static NFEdgeCapabilitiesStruct fromMap(Map<String, dynamic> data) =>
      NFEdgeCapabilitiesStruct(
        isAnimated: data['is_animated'] as bool?,
        isDeletable: data['is_deletable'] as bool?,
        isSelectable: data['is_selectable'] as bool?,
      );

  static NFEdgeCapabilitiesStruct? maybeFromMap(dynamic data) => data is Map
      ? NFEdgeCapabilitiesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'is_animated': _isAnimated,
        'is_deletable': _isDeletable,
        'is_selectable': _isSelectable,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'is_animated': serializeParam(
          _isAnimated,
          ParamType.bool,
        ),
        'is_deletable': serializeParam(
          _isDeletable,
          ParamType.bool,
        ),
        'is_selectable': serializeParam(
          _isSelectable,
          ParamType.bool,
        ),
      }.withoutNulls;

  static NFEdgeCapabilitiesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NFEdgeCapabilitiesStruct(
        isAnimated: deserializeParam(
          data['is_animated'],
          ParamType.bool,
          false,
        ),
        isDeletable: deserializeParam(
          data['is_deletable'],
          ParamType.bool,
          false,
        ),
        isSelectable: deserializeParam(
          data['is_selectable'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'NFEdgeCapabilitiesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFEdgeCapabilitiesStruct &&
        isAnimated == other.isAnimated &&
        isDeletable == other.isDeletable &&
        isSelectable == other.isSelectable;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([isAnimated, isDeletable, isSelectable]);
}

NFEdgeCapabilitiesStruct createNFEdgeCapabilitiesStruct({
  bool? isAnimated,
  bool? isDeletable,
  bool? isSelectable,
}) =>
    NFEdgeCapabilitiesStruct(
      isAnimated: isAnimated,
      isDeletable: isDeletable,
      isSelectable: isSelectable,
    );
