import 'package:collection/collection.dart';

enum NFPosition {
  top,
  right,
  bottom,
  left,
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
    default:
      return null;
  }
}
