// --- Day 5: If You Give A Seed A Fertilizer ---
// https://adventofcode.com/2023/day/5

import 'dart:math';

import 'package:collection/collection.dart';

final regExp = RegExp('(.*)-to-(.*) map:');

int solveA(List<String> input) {
  final (:seeds, :lookup) = parse(input);
  return seeds.map(lookup['seed']!.convert).reduce(min);
}

int solveB(List<String> input) {
  final (:seeds, :lookup) = parse(input);

  return seeds
      .slices(2)
      .expand((list) => Iterable.generate(list[1], (index) => index + list[0]))
      .map(lookup['seed']!.convert)
      .reduce(min);
}

({List<int> seeds, Map<String, AlmanacMap> lookup}) parse(List<String> input) {
  final seeds = [...input.first.split(' ').skip(1).map(int.parse)];
  final lookup = <String, AlmanacMap>{};

  for (final lines
      in input
          .skip(2)
          .where((line) => line.isNotEmpty)
          .splitBefore((line) => line.contains('map:'))) {
    final match = regExp.firstMatch(lines.first)!;

    final almanacMap = AlmanacMap(
      form: match[1]!,
      to: match[2]!,
      intervals: [...lines.skip(1).map(Interval.parse)],
    );
    lookup[almanacMap.form] = almanacMap;
  }

  for (final almanacMap in lookup.values) {
    almanacMap.next = lookup[almanacMap.to];
  }

  return (seeds: seeds, lookup: lookup);
}

class Interval {
  final int destinationCategory;
  final int sourceCategory;
  final int rangeLength;

  const Interval({
    required this.destinationCategory,
    required this.sourceCategory,
    required this.rangeLength,
  });

  factory Interval.parse(String line) => switch (line.split(' ')) {
    [
      final String destinationCategory,
      final String sourceCategory,
      final String rangeLength,
    ] =>
      Interval(
        destinationCategory: int.parse(destinationCategory),
        sourceCategory: int.parse(sourceCategory),
        rangeLength: int.parse(rangeLength),
      ),
    final list => throw Exception('Could not handle: $list'),
  };

  bool inRange(int sourceValue) =>
      sourceValue >= sourceCategory &&
      sourceValue <= sourceCategory + rangeLength;

  int convert(int sourceValue) => inRange(sourceValue)
      ? (sourceValue - sourceCategory) + destinationCategory
      : sourceValue;
}

class AlmanacMap {
  final String form;
  final String to;
  final List<Interval> intervals;
  AlmanacMap? next;

  AlmanacMap({required this.form, required this.to, required this.intervals});

  int convert(int inputValue) {
    AlmanacMap? currentAlmanacMap = this;
    var value = inputValue;

    while (currentAlmanacMap != null) {
      if (currentAlmanacMap.intervals.firstWhereOrNull(
            (interval) => interval.inRange(value),
          )
          case final interval?) {
        value = interval.convert(value);
      }
      currentAlmanacMap = currentAlmanacMap.next;
    }

    return value;
  }
}
