extension MapExtension on Map {
  Map removeNulls() => removeNullsFromMap(this);
}

extension ListExtension on List {
  List removeNulls() => removeNullsFromList(this);
}

Map<dynamic, dynamic> removeNullsFromMap(Map<dynamic, dynamic> json) => json
  ..removeWhere((dynamic key, dynamic value) => value == null)
  ..map<dynamic, dynamic>((key, value) => MapEntry(key, removeNulls(value)));

List removeNullsFromList(List list) => list
  ..removeWhere((value) => value == null)
  ..map((e) => removeNulls(e)).toList();

removeNulls(e) => (e is List)
    ? removeNullsFromList(e)
    : (e is Map ? removeNullsFromMap(e) : e);

extension Typing<T> on List<T> {
  /// Provide access to the generic type at runtime.
  Type get genericType => T;
}
