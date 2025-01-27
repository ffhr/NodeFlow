// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFEdgeInteractionStateStruct extends BaseStruct {
  NFEdgeInteractionStateStruct({
    bool? isSelected,
    bool? isAnimating,
    bool? isHovered,
  })  : _isSelected = isSelected,
        _isAnimating = isAnimating,
        _isHovered = isHovered;

  // "is_selected" field.
  bool? _isSelected;
  bool get isSelected => _isSelected ?? false;
  set isSelected(bool? val) => _isSelected = val;

  bool hasIsSelected() => _isSelected != null;

  // "is_animating" field.
  bool? _isAnimating;
  bool get isAnimating => _isAnimating ?? false;
  set isAnimating(bool? val) => _isAnimating = val;

  bool hasIsAnimating() => _isAnimating != null;

  // "is_hovered" field.
  bool? _isHovered;
  bool get isHovered => _isHovered ?? false;
  set isHovered(bool? val) => _isHovered = val;

  bool hasIsHovered() => _isHovered != null;

  static NFEdgeInteractionStateStruct fromMap(Map<String, dynamic> data) =>
      NFEdgeInteractionStateStruct(
        isSelected: data['is_selected'] as bool?,
        isAnimating: data['is_animating'] as bool?,
        isHovered: data['is_hovered'] as bool?,
      );

  static NFEdgeInteractionStateStruct? maybeFromMap(dynamic data) => data is Map
      ? NFEdgeInteractionStateStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'is_selected': _isSelected,
        'is_animating': _isAnimating,
        'is_hovered': _isHovered,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'is_selected': serializeParam(
          _isSelected,
          ParamType.bool,
        ),
        'is_animating': serializeParam(
          _isAnimating,
          ParamType.bool,
        ),
        'is_hovered': serializeParam(
          _isHovered,
          ParamType.bool,
        ),
      }.withoutNulls;

  static NFEdgeInteractionStateStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NFEdgeInteractionStateStruct(
        isSelected: deserializeParam(
          data['is_selected'],
          ParamType.bool,
          false,
        ),
        isAnimating: deserializeParam(
          data['is_animating'],
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
  String toString() => 'NFEdgeInteractionStateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFEdgeInteractionStateStruct &&
        isSelected == other.isSelected &&
        isAnimating == other.isAnimating &&
        isHovered == other.isHovered;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([isSelected, isAnimating, isHovered]);
}

NFEdgeInteractionStateStruct createNFEdgeInteractionStateStruct({
  bool? isSelected,
  bool? isAnimating,
  bool? isHovered,
}) =>
    NFEdgeInteractionStateStruct(
      isSelected: isSelected,
      isAnimating: isAnimating,
      isHovered: isHovered,
    );
