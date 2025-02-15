// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFDiagramThemeStruct extends BaseStruct {
  NFDiagramThemeStruct({
    NFColorStruct? inputSocketsDefaultColor,
    NFColorStruct? outputSocketsDefaultColor,
    NFColorStruct? nodesColor,
    NFColorStruct? edgesColor,
    NFColorStruct? axesColor,
    NFColorStruct? gridLinesColor,
    NFColorStruct? gridDotsColor,
    NFColorStruct? gridBackgroundColor,
  })  : _inputSocketsDefaultColor = inputSocketsDefaultColor,
        _outputSocketsDefaultColor = outputSocketsDefaultColor,
        _nodesColor = nodesColor,
        _edgesColor = edgesColor,
        _axesColor = axesColor,
        _gridLinesColor = gridLinesColor,
        _gridDotsColor = gridDotsColor,
        _gridBackgroundColor = gridBackgroundColor;

  // "input_sockets_default_color" field.
  NFColorStruct? _inputSocketsDefaultColor;
  NFColorStruct get inputSocketsDefaultColor =>
      _inputSocketsDefaultColor ?? NFColorStruct();
  set inputSocketsDefaultColor(NFColorStruct? val) =>
      _inputSocketsDefaultColor = val;

  void updateInputSocketsDefaultColor(Function(NFColorStruct) updateFn) {
    updateFn(_inputSocketsDefaultColor ??= NFColorStruct());
  }

  bool hasInputSocketsDefaultColor() => _inputSocketsDefaultColor != null;

  // "output_sockets_default_color" field.
  NFColorStruct? _outputSocketsDefaultColor;
  NFColorStruct get outputSocketsDefaultColor =>
      _outputSocketsDefaultColor ?? NFColorStruct();
  set outputSocketsDefaultColor(NFColorStruct? val) =>
      _outputSocketsDefaultColor = val;

  void updateOutputSocketsDefaultColor(Function(NFColorStruct) updateFn) {
    updateFn(_outputSocketsDefaultColor ??= NFColorStruct());
  }

  bool hasOutputSocketsDefaultColor() => _outputSocketsDefaultColor != null;

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

  // "axes_color" field.
  NFColorStruct? _axesColor;
  NFColorStruct get axesColor => _axesColor ?? NFColorStruct();
  set axesColor(NFColorStruct? val) => _axesColor = val;

  void updateAxesColor(Function(NFColorStruct) updateFn) {
    updateFn(_axesColor ??= NFColorStruct());
  }

  bool hasAxesColor() => _axesColor != null;

  // "grid_lines_color" field.
  NFColorStruct? _gridLinesColor;
  NFColorStruct get gridLinesColor => _gridLinesColor ?? NFColorStruct();
  set gridLinesColor(NFColorStruct? val) => _gridLinesColor = val;

  void updateGridLinesColor(Function(NFColorStruct) updateFn) {
    updateFn(_gridLinesColor ??= NFColorStruct());
  }

  bool hasGridLinesColor() => _gridLinesColor != null;

  // "grid_dots_color" field.
  NFColorStruct? _gridDotsColor;
  NFColorStruct get gridDotsColor => _gridDotsColor ?? NFColorStruct();
  set gridDotsColor(NFColorStruct? val) => _gridDotsColor = val;

  void updateGridDotsColor(Function(NFColorStruct) updateFn) {
    updateFn(_gridDotsColor ??= NFColorStruct());
  }

  bool hasGridDotsColor() => _gridDotsColor != null;

  // "grid_background_color" field.
  NFColorStruct? _gridBackgroundColor;
  NFColorStruct get gridBackgroundColor =>
      _gridBackgroundColor ?? NFColorStruct();
  set gridBackgroundColor(NFColorStruct? val) => _gridBackgroundColor = val;

  void updateGridBackgroundColor(Function(NFColorStruct) updateFn) {
    updateFn(_gridBackgroundColor ??= NFColorStruct());
  }

  bool hasGridBackgroundColor() => _gridBackgroundColor != null;

  static NFDiagramThemeStruct fromMap(Map<String, dynamic> data) =>
      NFDiagramThemeStruct(
        inputSocketsDefaultColor: data['input_sockets_default_color']
                is NFColorStruct
            ? data['input_sockets_default_color']
            : NFColorStruct.maybeFromMap(data['input_sockets_default_color']),
        outputSocketsDefaultColor: data['output_sockets_default_color']
                is NFColorStruct
            ? data['output_sockets_default_color']
            : NFColorStruct.maybeFromMap(data['output_sockets_default_color']),
        nodesColor: data['nodes_color'] is NFColorStruct
            ? data['nodes_color']
            : NFColorStruct.maybeFromMap(data['nodes_color']),
        edgesColor: data['edges_color'] is NFColorStruct
            ? data['edges_color']
            : NFColorStruct.maybeFromMap(data['edges_color']),
        axesColor: data['axes_color'] is NFColorStruct
            ? data['axes_color']
            : NFColorStruct.maybeFromMap(data['axes_color']),
        gridLinesColor: data['grid_lines_color'] is NFColorStruct
            ? data['grid_lines_color']
            : NFColorStruct.maybeFromMap(data['grid_lines_color']),
        gridDotsColor: data['grid_dots_color'] is NFColorStruct
            ? data['grid_dots_color']
            : NFColorStruct.maybeFromMap(data['grid_dots_color']),
        gridBackgroundColor: data['grid_background_color'] is NFColorStruct
            ? data['grid_background_color']
            : NFColorStruct.maybeFromMap(data['grid_background_color']),
      );

  static NFDiagramThemeStruct? maybeFromMap(dynamic data) => data is Map
      ? NFDiagramThemeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'input_sockets_default_color': _inputSocketsDefaultColor?.toMap(),
        'output_sockets_default_color': _outputSocketsDefaultColor?.toMap(),
        'nodes_color': _nodesColor?.toMap(),
        'edges_color': _edgesColor?.toMap(),
        'axes_color': _axesColor?.toMap(),
        'grid_lines_color': _gridLinesColor?.toMap(),
        'grid_dots_color': _gridDotsColor?.toMap(),
        'grid_background_color': _gridBackgroundColor?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'input_sockets_default_color': serializeParam(
          _inputSocketsDefaultColor,
          ParamType.DataStruct,
        ),
        'output_sockets_default_color': serializeParam(
          _outputSocketsDefaultColor,
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
        'axes_color': serializeParam(
          _axesColor,
          ParamType.DataStruct,
        ),
        'grid_lines_color': serializeParam(
          _gridLinesColor,
          ParamType.DataStruct,
        ),
        'grid_dots_color': serializeParam(
          _gridDotsColor,
          ParamType.DataStruct,
        ),
        'grid_background_color': serializeParam(
          _gridBackgroundColor,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static NFDiagramThemeStruct fromSerializableMap(Map<String, dynamic> data) =>
      NFDiagramThemeStruct(
        inputSocketsDefaultColor: deserializeStructParam(
          data['input_sockets_default_color'],
          ParamType.DataStruct,
          false,
          structBuilder: NFColorStruct.fromSerializableMap,
        ),
        outputSocketsDefaultColor: deserializeStructParam(
          data['output_sockets_default_color'],
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
        axesColor: deserializeStructParam(
          data['axes_color'],
          ParamType.DataStruct,
          false,
          structBuilder: NFColorStruct.fromSerializableMap,
        ),
        gridLinesColor: deserializeStructParam(
          data['grid_lines_color'],
          ParamType.DataStruct,
          false,
          structBuilder: NFColorStruct.fromSerializableMap,
        ),
        gridDotsColor: deserializeStructParam(
          data['grid_dots_color'],
          ParamType.DataStruct,
          false,
          structBuilder: NFColorStruct.fromSerializableMap,
        ),
        gridBackgroundColor: deserializeStructParam(
          data['grid_background_color'],
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
        inputSocketsDefaultColor == other.inputSocketsDefaultColor &&
        outputSocketsDefaultColor == other.outputSocketsDefaultColor &&
        nodesColor == other.nodesColor &&
        edgesColor == other.edgesColor &&
        axesColor == other.axesColor &&
        gridLinesColor == other.gridLinesColor &&
        gridDotsColor == other.gridDotsColor &&
        gridBackgroundColor == other.gridBackgroundColor;
  }

  @override
  int get hashCode => const ListEquality().hash([
        inputSocketsDefaultColor,
        outputSocketsDefaultColor,
        nodesColor,
        edgesColor,
        axesColor,
        gridLinesColor,
        gridDotsColor,
        gridBackgroundColor
      ]);
}

NFDiagramThemeStruct createNFDiagramThemeStruct({
  NFColorStruct? inputSocketsDefaultColor,
  NFColorStruct? outputSocketsDefaultColor,
  NFColorStruct? nodesColor,
  NFColorStruct? edgesColor,
  NFColorStruct? axesColor,
  NFColorStruct? gridLinesColor,
  NFColorStruct? gridDotsColor,
  NFColorStruct? gridBackgroundColor,
}) =>
    NFDiagramThemeStruct(
      inputSocketsDefaultColor: inputSocketsDefaultColor ?? NFColorStruct(),
      outputSocketsDefaultColor: outputSocketsDefaultColor ?? NFColorStruct(),
      nodesColor: nodesColor ?? NFColorStruct(),
      edgesColor: edgesColor ?? NFColorStruct(),
      axesColor: axesColor ?? NFColorStruct(),
      gridLinesColor: gridLinesColor ?? NFColorStruct(),
      gridDotsColor: gridDotsColor ?? NFColorStruct(),
      gridBackgroundColor: gridBackgroundColor ?? NFColorStruct(),
    );
