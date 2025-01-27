// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NodeStruct extends BaseStruct {
  NodeStruct({
    String? title,
    String? description,
    double? alignmentX,
    double? alignmentY,
    bool? isSelected,
    bool? isMoveable,
    List<NodeInputSocketStruct>? inputs,
    List<NodeOutputSocketStruct>? outputs,
  })  : _title = title,
        _description = description,
        _alignmentX = alignmentX,
        _alignmentY = alignmentY,
        _isSelected = isSelected,
        _isMoveable = isMoveable,
        _inputs = inputs,
        _outputs = outputs;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "alignmentX" field.
  double? _alignmentX;
  double get alignmentX => _alignmentX ?? 0.0;
  set alignmentX(double? val) => _alignmentX = val;

  void incrementAlignmentX(double amount) => alignmentX = alignmentX + amount;

  bool hasAlignmentX() => _alignmentX != null;

  // "alignmentY" field.
  double? _alignmentY;
  double get alignmentY => _alignmentY ?? 0.0;
  set alignmentY(double? val) => _alignmentY = val;

  void incrementAlignmentY(double amount) => alignmentY = alignmentY + amount;

  bool hasAlignmentY() => _alignmentY != null;

  // "isSelected" field.
  bool? _isSelected;
  bool get isSelected => _isSelected ?? false;
  set isSelected(bool? val) => _isSelected = val;

  bool hasIsSelected() => _isSelected != null;

  // "isMoveable" field.
  bool? _isMoveable;
  bool get isMoveable => _isMoveable ?? false;
  set isMoveable(bool? val) => _isMoveable = val;

  bool hasIsMoveable() => _isMoveable != null;

  // "inputs" field.
  List<NodeInputSocketStruct>? _inputs;
  List<NodeInputSocketStruct> get inputs => _inputs ?? const [];
  set inputs(List<NodeInputSocketStruct>? val) => _inputs = val;

  void updateInputs(Function(List<NodeInputSocketStruct>) updateFn) {
    updateFn(_inputs ??= []);
  }

  bool hasInputs() => _inputs != null;

  // "outputs" field.
  List<NodeOutputSocketStruct>? _outputs;
  List<NodeOutputSocketStruct> get outputs => _outputs ?? const [];
  set outputs(List<NodeOutputSocketStruct>? val) => _outputs = val;

  void updateOutputs(Function(List<NodeOutputSocketStruct>) updateFn) {
    updateFn(_outputs ??= []);
  }

  bool hasOutputs() => _outputs != null;

  static NodeStruct fromMap(Map<String, dynamic> data) => NodeStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
        alignmentX: castToType<double>(data['alignmentX']),
        alignmentY: castToType<double>(data['alignmentY']),
        isSelected: data['isSelected'] as bool?,
        isMoveable: data['isMoveable'] as bool?,
        inputs: getStructList(
          data['inputs'],
          NodeInputSocketStruct.fromMap,
        ),
        outputs: getStructList(
          data['outputs'],
          NodeOutputSocketStruct.fromMap,
        ),
      );

  static NodeStruct? maybeFromMap(dynamic data) =>
      data is Map ? NodeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
        'alignmentX': _alignmentX,
        'alignmentY': _alignmentY,
        'isSelected': _isSelected,
        'isMoveable': _isMoveable,
        'inputs': _inputs?.map((e) => e.toMap()).toList(),
        'outputs': _outputs?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'alignmentX': serializeParam(
          _alignmentX,
          ParamType.double,
        ),
        'alignmentY': serializeParam(
          _alignmentY,
          ParamType.double,
        ),
        'isSelected': serializeParam(
          _isSelected,
          ParamType.bool,
        ),
        'isMoveable': serializeParam(
          _isMoveable,
          ParamType.bool,
        ),
        'inputs': serializeParam(
          _inputs,
          ParamType.DataStruct,
          isList: true,
        ),
        'outputs': serializeParam(
          _outputs,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static NodeStruct fromSerializableMap(Map<String, dynamic> data) =>
      NodeStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        alignmentX: deserializeParam(
          data['alignmentX'],
          ParamType.double,
          false,
        ),
        alignmentY: deserializeParam(
          data['alignmentY'],
          ParamType.double,
          false,
        ),
        isSelected: deserializeParam(
          data['isSelected'],
          ParamType.bool,
          false,
        ),
        isMoveable: deserializeParam(
          data['isMoveable'],
          ParamType.bool,
          false,
        ),
        inputs: deserializeStructParam<NodeInputSocketStruct>(
          data['inputs'],
          ParamType.DataStruct,
          true,
          structBuilder: NodeInputSocketStruct.fromSerializableMap,
        ),
        outputs: deserializeStructParam<NodeOutputSocketStruct>(
          data['outputs'],
          ParamType.DataStruct,
          true,
          structBuilder: NodeOutputSocketStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'NodeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is NodeStruct &&
        title == other.title &&
        description == other.description &&
        alignmentX == other.alignmentX &&
        alignmentY == other.alignmentY &&
        isSelected == other.isSelected &&
        isMoveable == other.isMoveable &&
        listEquality.equals(inputs, other.inputs) &&
        listEquality.equals(outputs, other.outputs);
  }

  @override
  int get hashCode => const ListEquality().hash([
        title,
        description,
        alignmentX,
        alignmentY,
        isSelected,
        isMoveable,
        inputs,
        outputs
      ]);
}

NodeStruct createNodeStruct({
  String? title,
  String? description,
  double? alignmentX,
  double? alignmentY,
  bool? isSelected,
  bool? isMoveable,
}) =>
    NodeStruct(
      title: title,
      description: description,
      alignmentX: alignmentX,
      alignmentY: alignmentY,
      isSelected: isSelected,
      isMoveable: isMoveable,
    );
