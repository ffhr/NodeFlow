// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NodeStruct extends BaseStruct {
  NodeStruct({
    String? title,
    String? description,
    bool? isSelected,
    bool? isMoveable,
    List<NodeInputSocketStruct>? inputs,
    List<NodeOutputSocketStruct>? outputs,
    NFOffsetStruct? virtualPosition,
    NFSizeStruct? size,
  })  : _title = title,
        _description = description,
        _isSelected = isSelected,
        _isMoveable = isMoveable,
        _inputs = inputs,
        _outputs = outputs,
        _virtualPosition = virtualPosition,
        _size = size;

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

  // "virtual_position" field.
  NFOffsetStruct? _virtualPosition;
  NFOffsetStruct get virtualPosition => _virtualPosition ?? NFOffsetStruct();
  set virtualPosition(NFOffsetStruct? val) => _virtualPosition = val;

  void updateVirtualPosition(Function(NFOffsetStruct) updateFn) {
    updateFn(_virtualPosition ??= NFOffsetStruct());
  }

  bool hasVirtualPosition() => _virtualPosition != null;

  // "size" field.
  NFSizeStruct? _size;
  NFSizeStruct get size => _size ?? NFSizeStruct();
  set size(NFSizeStruct? val) => _size = val;

  void updateSize(Function(NFSizeStruct) updateFn) {
    updateFn(_size ??= NFSizeStruct());
  }

  bool hasSize() => _size != null;

  static NodeStruct fromMap(Map<String, dynamic> data) => NodeStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
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
        virtualPosition: data['virtual_position'] is NFOffsetStruct
            ? data['virtual_position']
            : NFOffsetStruct.maybeFromMap(data['virtual_position']),
        size: data['size'] is NFSizeStruct
            ? data['size']
            : NFSizeStruct.maybeFromMap(data['size']),
      );

  static NodeStruct? maybeFromMap(dynamic data) =>
      data is Map ? NodeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
        'isSelected': _isSelected,
        'isMoveable': _isMoveable,
        'inputs': _inputs?.map((e) => e.toMap()).toList(),
        'outputs': _outputs?.map((e) => e.toMap()).toList(),
        'virtual_position': _virtualPosition?.toMap(),
        'size': _size?.toMap(),
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
        'virtual_position': serializeParam(
          _virtualPosition,
          ParamType.DataStruct,
        ),
        'size': serializeParam(
          _size,
          ParamType.DataStruct,
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
        virtualPosition: deserializeStructParam(
          data['virtual_position'],
          ParamType.DataStruct,
          false,
          structBuilder: NFOffsetStruct.fromSerializableMap,
        ),
        size: deserializeStructParam(
          data['size'],
          ParamType.DataStruct,
          false,
          structBuilder: NFSizeStruct.fromSerializableMap,
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
        isSelected == other.isSelected &&
        isMoveable == other.isMoveable &&
        listEquality.equals(inputs, other.inputs) &&
        listEquality.equals(outputs, other.outputs) &&
        virtualPosition == other.virtualPosition &&
        size == other.size;
  }

  @override
  int get hashCode => const ListEquality().hash([
        title,
        description,
        isSelected,
        isMoveable,
        inputs,
        outputs,
        virtualPosition,
        size
      ]);
}

NodeStruct createNodeStruct({
  String? title,
  String? description,
  bool? isSelected,
  bool? isMoveable,
  NFOffsetStruct? virtualPosition,
  NFSizeStruct? size,
}) =>
    NodeStruct(
      title: title,
      description: description,
      isSelected: isSelected,
      isMoveable: isMoveable,
      virtualPosition: virtualPosition ?? NFOffsetStruct(),
      size: size ?? NFSizeStruct(),
    );
