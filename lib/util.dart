import 'dart:convert';

extension StringAsLinesExtension on String {
  Iterable<String> get asLines => LineSplitter.split(this);
  List<String> toLinesList() => asLines.toList(growable: false);
}
