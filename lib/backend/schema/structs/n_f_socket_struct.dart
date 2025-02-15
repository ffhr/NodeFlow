// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFSocketStruct extends BaseStruct {
  NFSocketStruct({
    String? label,
    NFColorStruct? defaultColor,
    NFColorStruct? selectedColor,
  })  : _label = label,
        _defaultColor = defaultColor,
        _selectedColor = selectedColor;

  // "label" field.
  String? _label;
  String get label => _label ?? '<SOCKET_TITLE>';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  // "default_color" field.
  NFColorStruct? _defaultColor;
  NFColorStruct get defaultColor => _defaultColor ?? NFColorStruct();
  set defaultColor(NFColorStruct? val) => _defaultColor = val;

  void updateDefaultColor(Function(NFColorStruct) updateFn) {
    updateFn(_defaultColor ??= NFColorStruct());
  }

  bool hasDefaultColor() => _defaultColor != null;

  // "selected_color" field.
  NFColorStruct? _selectedColor;
  NFColorStruct get selectedColor => _selectedColor ?? NFColorStruct();
  set selectedColor(NFColorStruct? val) => _selectedColor = val;

  void updateSelectedColor(Function(NFColorStruct) updateFn) {
    updateFn(_selectedColor ??= NFColorStruct());
  }

  bool hasSelectedColor() => _selectedColor != null;

  static NFSocketStruct fromMap(Map<String, dynamic> data) => NFSocketStruct(
        label: data['label'] as String?,
        defaultColor: data['default_color'] is NFColorStruct
            ? data['default_color']
            : NFColorStruct.maybeFromMap(data['default_color']),
        selectedColor: data['selected_color'] is NFColorStruct
            ? data['selected_color']
            : NFColorStruct.maybeFromMap(data['selected_color']),
      );

  static NFSocketStruct? maybeFromMap(dynamic data) =>
      data is Map ? NFSocketStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'label': _label,
        'default_color': _defaultColor?.toMap(),
        'selected_color': _selectedColor?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'default_color': serializeParam(
          _defaultColor,
          ParamType.DataStruct,
        ),
        'selected_color': serializeParam(
          _selectedColor,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static NFSocketStruct fromSerializableMap(Map<String, dynamic> data) =>
      NFSocketStruct(
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        defaultColor: deserializeStructParam(
          data['default_color'],
          ParamType.DataStruct,
          false,
          structBuilder: NFColorStruct.fromSerializableMap,
        ),
        selectedColor: deserializeStructParam(
          data['selected_color'],
          ParamType.DataStruct,
          false,
          structBuilder: NFColorStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'NFSocketStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFSocketStruct &&
        label == other.label &&
        defaultColor == other.defaultColor &&
        selectedColor == other.selectedColor;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([label, defaultColor, selectedColor]);
}

NFSocketStruct createNFSocketStruct({
  String? label,
  NFColorStruct? defaultColor,
  NFColorStruct? selectedColor,
}) =>
    NFSocketStruct(
      label: label,
      defaultColor: defaultColor ?? NFColorStruct(),
      selectedColor: selectedColor ?? NFColorStruct(),
    );
