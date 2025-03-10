// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFNodeInteractionStateStruct extends BaseStruct {
  NFNodeInteractionStateStruct({
    bool? isSelected,
    bool? isDragging,
    bool? isConnecting,
    bool? isHovered,
  })  : _isSelected = isSelected,
        _isDragging = isDragging,
        _isConnecting = isConnecting,
        _isHovered = isHovered;

  // "is_selected" field.
  bool? _isSelected;
  bool get isSelected => _isSelected ?? false;
  set isSelected(bool? val) => _isSelected = val;

  bool hasIsSelected() => _isSelected != null;

  // "is_dragging" field.
  bool? _isDragging;
  bool get isDragging => _isDragging ?? false;
  set isDragging(bool? val) => _isDragging = val;

  bool hasIsDragging() => _isDragging != null;

  // "is_connecting" field.
  bool? _isConnecting;
  bool get isConnecting => _isConnecting ?? false;
  set isConnecting(bool? val) => _isConnecting = val;

  bool hasIsConnecting() => _isConnecting != null;

  // "is_hovered" field.
  bool? _isHovered;
  bool get isHovered => _isHovered ?? false;
  set isHovered(bool? val) => _isHovered = val;

  bool hasIsHovered() => _isHovered != null;

  static NFNodeInteractionStateStruct fromMap(Map<String, dynamic> data) =>
      NFNodeInteractionStateStruct(
        isSelected: data['is_selected'] as bool?,
        isDragging: data['is_dragging'] as bool?,
        isConnecting: data['is_connecting'] as bool?,
        isHovered: data['is_hovered'] as bool?,
      );

  static NFNodeInteractionStateStruct? maybeFromMap(dynamic data) => data is Map
      ? NFNodeInteractionStateStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'is_selected': _isSelected,
        'is_dragging': _isDragging,
        'is_connecting': _isConnecting,
        'is_hovered': _isHovered,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'is_selected': serializeParam(
          _isSelected,
          ParamType.bool,
        ),
        'is_dragging': serializeParam(
          _isDragging,
          ParamType.bool,
        ),
        'is_connecting': serializeParam(
          _isConnecting,
          ParamType.bool,
        ),
        'is_hovered': serializeParam(
          _isHovered,
          ParamType.bool,
        ),
      }.withoutNulls;

  static NFNodeInteractionStateStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NFNodeInteractionStateStruct(
        isSelected: deserializeParam(
          data['is_selected'],
          ParamType.bool,
          false,
        ),
        isDragging: deserializeParam(
          data['is_dragging'],
          ParamType.bool,
          false,
        ),
        isConnecting: deserializeParam(
          data['is_connecting'],
          ParamType.bool,
          false,
        ),
        isHovered: deserializeParam(
          data['is_hovered'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'NFNodeInteractionStateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFNodeInteractionStateStruct &&
        isSelected == other.isSelected &&
        isDragging == other.isDragging &&
        isConnecting == other.isConnecting &&
        isHovered == other.isHovered;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([isSelected, isDragging, isConnecting, isHovered]);
}

NFNodeInteractionStateStruct createNFNodeInteractionStateStruct({
  bool? isSelected,
  bool? isDragging,
  bool? isConnecting,
  bool? isHovered,
}) =>
    NFNodeInteractionStateStruct(
      isSelected: isSelected,
      isDragging: isDragging,
      isConnecting: isConnecting,
      isHovered: isHovered,
    );
