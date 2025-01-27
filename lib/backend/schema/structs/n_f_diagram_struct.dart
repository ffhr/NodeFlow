// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFDiagramStruct extends BaseStruct {
  NFDiagramStruct({
    NFDiagramIdStruct? diagramId,
    NFPosition? inputsPosition,
    NFPosition? outputsPosition,
    NFViewportStruct? viewport,
  })  : _diagramId = diagramId,
        _inputsPosition = inputsPosition,
        _outputsPosition = outputsPosition,
        _viewport = viewport;

  // "diagram_id" field.
  NFDiagramIdStruct? _diagramId;
  NFDiagramIdStruct get diagramId => _diagramId ?? NFDiagramIdStruct();
  set diagramId(NFDiagramIdStruct? val) => _diagramId = val;

  void updateDiagramId(Function(NFDiagramIdStruct) updateFn) {
    updateFn(_diagramId ??= NFDiagramIdStruct());
  }

  bool hasDiagramId() => _diagramId != null;

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
        diagramId: data['diagram_id'] is NFDiagramIdStruct
            ? data['diagram_id']
            : NFDiagramIdStruct.maybeFromMap(data['diagram_id']),
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
        'diagram_id': _diagramId?.toMap(),
        'inputs_position': _inputsPosition?.serialize(),
        'outputs_position': _outputsPosition?.serialize(),
        'viewport': _viewport?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'diagram_id': serializeParam(
          _diagramId,
          ParamType.DataStruct,
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
        diagramId: deserializeStructParam(
          data['diagram_id'],
          ParamType.DataStruct,
          false,
          structBuilder: NFDiagramIdStruct.fromSerializableMap,
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
        diagramId == other.diagramId &&
        inputsPosition == other.inputsPosition &&
        outputsPosition == other.outputsPosition &&
        viewport == other.viewport;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([diagramId, inputsPosition, outputsPosition, viewport]);
}

NFDiagramStruct createNFDiagramStruct({
  NFDiagramIdStruct? diagramId,
  NFPosition? inputsPosition,
  NFPosition? outputsPosition,
  NFViewportStruct? viewport,
}) =>
    NFDiagramStruct(
      diagramId: diagramId ?? NFDiagramIdStruct(),
      inputsPosition: inputsPosition,
      outputsPosition: outputsPosition,
      viewport: viewport ?? NFViewportStruct(),
    );
