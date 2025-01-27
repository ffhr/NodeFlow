// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFNodeCapabilitiesStruct extends BaseStruct {
  NFNodeCapabilitiesStruct({
    bool? isSelectable,
    bool? isDraggable,
    bool? isConnectable,
    bool? isDeletable,
  })  : _isSelectable = isSelectable,
        _isDraggable = isDraggable,
        _isConnectable = isConnectable,
        _isDeletable = isDeletable;

  // "is_selectable" field.
  bool? _isSelectable;
  bool get isSelectable => _isSelectable ?? true;
  set isSelectable(bool? val) => _isSelectable = val;

  bool hasIsSelectable() => _isSelectable != null;

  // "is_draggable" field.
  bool? _isDraggable;
  bool get isDraggable => _isDraggable ?? true;
  set isDraggable(bool? val) => _isDraggable = val;

  bool hasIsDraggable() => _isDraggable != null;

  // "is_connectable" field.
  bool? _isConnectable;
  bool get isConnectable => _isConnectable ?? true;
  set isConnectable(bool? val) => _isConnectable = val;

  bool hasIsConnectable() => _isConnectable != null;

  // "is_deletable" field.
  bool? _isDeletable;
  bool get isDeletable => _isDeletable ?? true;
  set isDeletable(bool? val) => _isDeletable = val;

  bool hasIsDeletable() => _isDeletable != null;

  static NFNodeCapabilitiesStruct fromMap(Map<String, dynamic> data) =>
      NFNodeCapabilitiesStruct(
        isSelectable: data['is_selectable'] as bool?,
        isDraggable: data['is_draggable'] as bool?,
        isConnectable: data['is_connectable'] as bool?,
        isDeletable: data['is_deletable'] as bool?,
      );

  static NFNodeCapabilitiesStruct? maybeFromMap(dynamic data) => data is Map
      ? NFNodeCapabilitiesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'is_selectable': _isSelectable,
        'is_draggable': _isDraggable,
        'is_connectable': _isConnectable,
        'is_deletable': _isDeletable,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'is_selectable': serializeParam(
          _isSelectable,
          ParamType.bool,
        ),
        'is_draggable': serializeParam(
          _isDraggable,
          ParamType.bool,
        ),
        'is_connectable': serializeParam(
          _isConnectable,
          ParamType.bool,
        ),
        'is_deletable': serializeParam(
          _isDeletable,
          ParamType.bool,
        ),
      }.withoutNulls;

  static NFNodeCapabilitiesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NFNodeCapabilitiesStruct(
        isSelectable: deserializeParam(
          data['is_selectable'],
          ParamType.bool,
          false,
        ),
        isDraggable: deserializeParam(
          data['is_draggable'],
          ParamType.bool,
          false,
        ),
        isConnectable: deserializeParam(
          data['is_connectable'],
          ParamType.bool,
          false,
        ),
        isDeletable: deserializeParam(
          data['is_deletable'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'NFNodeCapabilitiesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFNodeCapabilitiesStruct &&
        isSelectable == other.isSelectable &&
        isDraggable == other.isDraggable &&
        isConnectable == other.isConnectable &&
        isDeletable == other.isDeletable;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([isSelectable, isDraggable, isConnectable, isDeletable]);
}

NFNodeCapabilitiesStruct createNFNodeCapabilitiesStruct({
  bool? isSelectable,
  bool? isDraggable,
  bool? isConnectable,
  bool? isDeletable,
}) =>
    NFNodeCapabilitiesStruct(
      isSelectable: isSelectable,
      isDraggable: isDraggable,
      isConnectable: isConnectable,
      isDeletable: isDeletable,
    );
