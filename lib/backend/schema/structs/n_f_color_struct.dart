// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFColorStruct extends BaseStruct {
  NFColorStruct({
    Color? light,
    Color? dark,
  })  : _light = light,
        _dark = dark;

  // "light" field.
  Color? _light;
  Color get light => _light ?? Colors.black;
  set light(Color? val) => _light = val;

  bool hasLight() => _light != null;

  // "dark" field.
  Color? _dark;
  Color get dark => _dark ?? Colors.white;
  set dark(Color? val) => _dark = val;

  bool hasDark() => _dark != null;

  static NFColorStruct fromMap(Map<String, dynamic> data) => NFColorStruct(
        light: getSchemaColor(data['light']),
        dark: getSchemaColor(data['dark']),
      );

  static NFColorStruct? maybeFromMap(dynamic data) =>
      data is Map ? NFColorStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'light': _light,
        'dark': _dark,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'light': serializeParam(
          _light,
          ParamType.Color,
        ),
        'dark': serializeParam(
          _dark,
          ParamType.Color,
        ),
      }.withoutNulls;

  static NFColorStruct fromSerializableMap(Map<String, dynamic> data) =>
      NFColorStruct(
        light: deserializeParam(
          data['light'],
          ParamType.Color,
          false,
        ),
        dark: deserializeParam(
          data['dark'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'NFColorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFColorStruct && light == other.light && dark == other.dark;
  }

  @override
  int get hashCode => const ListEquality().hash([light, dark]);
}

NFColorStruct createNFColorStruct({
  Color? light,
  Color? dark,
}) =>
    NFColorStruct(
      light: light,
      dark: dark,
    );
