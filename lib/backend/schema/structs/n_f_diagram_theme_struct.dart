// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFDiagramThemeStruct extends BaseStruct {
  NFDiagramThemeStruct({
    NFColorStruct? inputSocketsColor,
    NFColorStruct? outputSocketsColor,
    NFColorStruct? nodesColor,
    NFColorStruct? edgesColor,
  })  : _inputSocketsColor = inputSocketsColor,
        _outputSocketsColor = outputSocketsColor,
        _nodesColor = nodesColor,
        _edgesColor = edgesColor;

  // "input_sockets_color" field.
  NFColorStruct? _inputSocketsColor;
  NFColorStruct get inputSocketsColor => _inputSocketsColor ?? NFColorStruct();
  set inputSocketsColor(NFColorStruct? val) => _inputSocketsColor = val;

  void updateInputSocketsColor(Function(NFColorStruct) updateFn) {
    updateFn(_inputSocketsColor ??= NFColorStruct());
  }

  bool hasInputSocketsColor() => _inputSocketsColor != null;

  // "output_sockets_color" field.
  NFColorStruct? _outputSocketsColor;
  NFColorStruct get outputSocketsColor =>
      _outputSocketsColor ?? NFColorStruct();
  set outputSocketsColor(NFColorStruct? val) => _outputSocketsColor = val;

  void updateOutputSocketsColor(Function(NFColorStruct) updateFn) {
    updateFn(_outputSocketsColor ??= NFColorStruct());
  }

  bool hasOutputSocketsColor() => _outputSocketsColor != null;

  // "nodes_color" field.
  NFColorStruct? _nodesColor;
  NFColorStruct get nodesColor => _nodesColor ?? NFColorStruct();
  set nodesColor(NFColorStruct? val) => _nodesColor = val;

  void updateNodesColor(Function(NFColorStruct) updateFn) {
    updateFn(_nodesColor ??= NFColorStruct());
  }

  bool hasNodesColor() => _nodesColor != null;

  // "edges_color" field.
  NFColorStruct? _edgesColor;
  NFColorStruct get edgesColor => _edgesColor ?? NFColorStruct();
  set edgesColor(NFColorStruct? val) => _edgesColor = val;

  void updateEdgesColor(Function(NFColorStruct) updateFn) {
    updateFn(_edgesColor ??= NFColorStruct());
  }

  bool hasEdgesColor() => _edgesColor != null;

  static NFDiagramThemeStruct fromMap(Map<String, dynamic> data) =>
      NFDiagramThemeStruct(
        inputSocketsColor: data['input_sockets_color'] is NFColorStruct
            ? data['input_sockets_color']
            : NFColorStruct.maybeFromMap(data['input_sockets_color']),
        outputSocketsColor: data['output_sockets_color'] is NFColorStruct
            ? data['output_sockets_color']
            : NFColorStruct.maybeFromMap(data['output_sockets_color']),
        nodesColor: data['nodes_color'] is NFColorStruct
            ? data['nodes_color']
            : NFColorStruct.maybeFromMap(data['nodes_color']),
        edgesColor: data['edges_color'] is NFColorStruct
            ? data['edges_color']
            : NFColorStruct.maybeFromMap(data['edges_color']),
      );

  static NFDiagramThemeStruct? maybeFromMap(dynamic data) => data is Map
      ? NFDiagramThemeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'input_sockets_color': _inputSocketsColor?.toMap(),
        'output_sockets_color': _outputSocketsColor?.toMap(),
        'nodes_color': _nodesColor?.toMap(),
        'edges_color': _edgesColor?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'input_sockets_color': serializeParam(
          _inputSocketsColor,
          ParamType.DataStruct,
        ),
        'output_sockets_color': serializeParam(
          _outputSocketsColor,
          ParamType.DataStruct,
        ),
        'nodes_color': serializeParam(
          _nodesColor,
          ParamType.DataStruct,
        ),
        'edges_color': serializeParam(
          _edgesColor,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static NFDiagramThemeStruct fromSerializableMap(Map<String, dynamic> data) =>
      NFDiagramThemeStruct(
        inputSocketsColor: deserializeStructParam(
          data['input_sockets_color'],
          ParamType.DataStruct,
          false,
          structBuilder: NFColorStruct.fromSerializableMap,
        ),
        outputSocketsColor: deserializeStructParam(
          data['output_sockets_color'],
          ParamType.DataStruct,
          false,
          structBuilder: NFColorStruct.fromSerializableMap,
        ),
        nodesColor: deserializeStructParam(
          data['nodes_color'],
          ParamType.DataStruct,
          false,
          structBuilder: NFColorStruct.fromSerializableMap,
        ),
        edgesColor: deserializeStructParam(
          data['edges_color'],
          ParamType.DataStruct,
          false,
          structBuilder: NFColorStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'NFDiagramThemeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFDiagramThemeStruct &&
        inputSocketsColor == other.inputSocketsColor &&
        outputSocketsColor == other.outputSocketsColor &&
        nodesColor == other.nodesColor &&
        edgesColor == other.edgesColor;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([inputSocketsColor, outputSocketsColor, nodesColor, edgesColor]);
}

NFDiagramThemeStruct createNFDiagramThemeStruct({
  NFColorStruct? inputSocketsColor,
  NFColorStruct? outputSocketsColor,
  NFColorStruct? nodesColor,
  NFColorStruct? edgesColor,
}) =>
    NFDiagramThemeStruct(
      inputSocketsColor: inputSocketsColor ?? NFColorStruct(),
      outputSocketsColor: outputSocketsColor ?? NFColorStruct(),
      nodesColor: nodesColor ?? NFColorStruct(),
      edgesColor: edgesColor ?? NFColorStruct(),
    );
