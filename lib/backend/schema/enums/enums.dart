import 'package:collection/collection.dart';

enum NFPosition {
  top,
  right,
  bottom,
  left,
}

enum NFEntityTypeShort {
  dg,
  nd,
  ed,
  ins,
  ots,
}

enum NFEntityTypeLong {
  diagram,
  node,
  edge,
  input_socket,
  output_socket,
}

enum NFEdgeDrawingStateType {
  inactive,
  started,
  active,
  finished,
}

enum CurvedLoopType {
  topToBottom,
  bottomToTop,
}

enum NFLineType {
  solid,
  dotted,
}

enum NFGridType {
  grid,
  dots,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (NFPosition):
      return NFPosition.values.deserialize(value) as T?;
    case (NFEntityTypeShort):
      return NFEntityTypeShort.values.deserialize(value) as T?;
    case (NFEntityTypeLong):
      return NFEntityTypeLong.values.deserialize(value) as T?;
    case (NFEdgeDrawingStateType):
      return NFEdgeDrawingStateType.values.deserialize(value) as T?;
    case (CurvedLoopType):
      return CurvedLoopType.values.deserialize(value) as T?;
    case (NFLineType):
      return NFLineType.values.deserialize(value) as T?;
    case (NFGridType):
      return NFGridType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
