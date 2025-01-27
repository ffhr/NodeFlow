// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFDiagramStruct extends BaseStruct {
  NFDiagramStruct({
    NFDiagramIdStruct? diagramId,
    NFPosition? inputSocketsPosition,
    NFPosition? outputSocketsPosition,
    NFViewportStruct? viewport,
  })  : _diagramId = diagramId,
        _inputSocketsPosition = inputSocketsPosition,
        _outputSocketsPosition = outputSocketsPosition,
        _viewport = viewport;

  // "diagram_id" field.
  NFDiagramIdStruct? _diagramId;
  NFDiagramIdStruct get diagramId => _diagramId ?? NFDiagramIdStruct();
  set diagramId(NFDiagramIdStruct? val) => _diagramId = val;

  void updateDiagramId(Function(NFDiagramIdStruct) updateFn) {
    updateFn(_diagramId ??= NFDiagramIdStruct());
  }

  bool hasDiagramId() => _diagramId != null;

  // "input_sockets_position" field.
  NFPosition? _inputSocketsPosition;
  NFPosition get inputSocketsPosition =>
      _inputSocketsPosition ?? NFPosition.left;
  set inputSocketsPosition(NFPosition? val) => _inputSocketsPosition = val;

  bool hasInputSocketsPosition() => _inputSocketsPosition != null;

  // "output_sockets_position" field.
  NFPosition? _outputSocketsPosition;
  NFPosition get outputSocketsPosition =>
      _outputSocketsPosition ?? NFPosition.right;
  set outputSocketsPosition(NFPosition? val) => _outputSocketsPosition = val;

  bool hasOutputSocketsPosition() => _outputSocketsPosition != null;

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
        inputSocketsPosition: data['input_sockets_position'] is NFPosition
            ? data['input_sockets_position']
            : deserializeEnum<NFPosition>(data['input_sockets_position']),
        outputSocketsPosition: data['output_sockets_position'] is NFPosition
            ? data['output_sockets_position']
            : deserializeEnum<NFPosition>(data['output_sockets_position']),
        viewport: data['viewport'] is NFViewportStruct
            ? data['viewport']
            : NFViewportStruct.maybeFromMap(data['viewport']),
      );

  static NFDiagramStruct? maybeFromMap(dynamic data) => data is Map
      ? NFDiagramStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'diagram_id': _diagramId?.toMap(),
        'input_sockets_position': _inputSocketsPosition?.serialize(),
        'output_sockets_position': _outputSocketsPosition?.serialize(),
        'viewport': _viewport?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'diagram_id': serializeParam(
          _diagramId,
          ParamType.DataStruct,
        ),
        'input_sockets_position': serializeParam(
          _inputSocketsPosition,
          ParamType.Enum,
        ),
        'output_sockets_position': serializeParam(
          _outputSocketsPosition,
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
        inputSocketsPosition: deserializeParam<NFPosition>(
          data['input_sockets_position'],
          ParamType.Enum,
          false,
        ),
        outputSocketsPosition: deserializeParam<NFPosition>(
          data['output_sockets_position'],
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
        inputSocketsPosition == other.inputSocketsPosition &&
        outputSocketsPosition == other.outputSocketsPosition &&
        viewport == other.viewport;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([diagramId, inputSocketsPosition, outputSocketsPosition, viewport]);
}

NFDiagramStruct createNFDiagramStruct({
  NFDiagramIdStruct? diagramId,
  NFPosition? inputSocketsPosition,
  NFPosition? outputSocketsPosition,
  NFViewportStruct? viewport,
}) =>
    NFDiagramStruct(
      diagramId: diagramId ?? NFDiagramIdStruct(),
      inputSocketsPosition: inputSocketsPosition,
      outputSocketsPosition: outputSocketsPosition,
      viewport: viewport ?? NFViewportStruct(),
    );
