// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFDiagramStruct extends BaseStruct {
  NFDiagramStruct({
    String? id,
    NFPosition? inputsPosition,
    NFPosition? outputsPosition,
    NFViewportStruct? viewport,
  })  : _id = id,
        _inputsPosition = inputsPosition,
        _outputsPosition = outputsPosition,
        _viewport = viewport;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "inputs_position" field.
  NFPosition? _inputsPosition;
  NFPosition get inputsPosition => _inputsPosition ?? NFPosition.left;
  set inputsPosition(NFPosition? val) => _inputsPosition = val;

  bool hasInputsPosition() => _inputsPosition != null;

  // "outputs_position" field.
  NFPosition? _outputsPosition;
  NFPosition get outputsPosition => _outputsPosition ?? NFPosition.right;
  set outputsPosition(NFPosition? val) => _outputsPosition = val;

  bool hasOutputsPosition() => _outputsPosition != null;

  // "viewport" field.
  NFViewportStruct? _viewport;
  NFViewportStruct get viewport => _viewport ?? NFViewportStruct();
  set viewport(NFViewportStruct? val) => _viewport = val;

  void updateViewport(Function(NFViewportStruct) updateFn) {
    updateFn(_viewport ??= NFViewportStruct());
  }

  bool hasViewport() => _viewport != null;

  static NFDiagramStruct fromMap(Map<String, dynamic> data) => NFDiagramStruct(
        id: data['id'] as String?,
        inputsPosition: data['inputs_position'] is NFPosition
            ? data['inputs_position']
            : deserializeEnum<NFPosition>(data['inputs_position']),
        outputsPosition: data['outputs_position'] is NFPosition
            ? data['outputs_position']
            : deserializeEnum<NFPosition>(data['outputs_position']),
        viewport: data['viewport'] is NFViewportStruct
            ? data['viewport']
            : NFViewportStruct.maybeFromMap(data['viewport']),
      );

  static NFDiagramStruct? maybeFromMap(dynamic data) => data is Map
      ? NFDiagramStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'inputs_position': _inputsPosition?.serialize(),
        'outputs_position': _outputsPosition?.serialize(),
        'viewport': _viewport?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'inputs_position': serializeParam(
          _inputsPosition,
          ParamType.Enum,
        ),
        'outputs_position': serializeParam(
          _outputsPosition,
          ParamType.Enum,
        ),
        'viewport': serializeParam(
          _viewport,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static NFDiagramStruct fromSerializableMap(Map<String, dynamic> data) =>
      NFDiagramStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        inputsPosition: deserializeParam<NFPosition>(
          data['inputs_position'],
          ParamType.Enum,
          false,
        ),
        outputsPosition: deserializeParam<NFPosition>(
          data['outputs_position'],
          ParamType.Enum,
          false,
        ),
        viewport: deserializeStructParam(
          data['viewport'],
          ParamType.DataStruct,
          false,
          structBuilder: NFViewportStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'NFDiagramStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFDiagramStruct &&
        id == other.id &&
        inputsPosition == other.inputsPosition &&
        outputsPosition == other.outputsPosition &&
        viewport == other.viewport;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, inputsPosition, outputsPosition, viewport]);
}

NFDiagramStruct createNFDiagramStruct({
  String? id,
  NFPosition? inputsPosition,
  NFPosition? outputsPosition,
  NFViewportStruct? viewport,
}) =>
    NFDiagramStruct(
      id: id,
      inputsPosition: inputsPosition,
      outputsPosition: outputsPosition,
      viewport: viewport ?? NFViewportStruct(),
    );
