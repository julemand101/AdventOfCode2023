// --- Day 5: If You Give A Seed A Fertilizer ---
// https://adventofcode.com/2023/day/5

import 'dart:io';
import 'package:advent_of_code_2023/day05.dart';
import 'package:advent_of_code_2023/util.dart';
import 'package:test/test.dart';

final input = File('test/data/day05.txt').readAsLinesSync();
final exampleInput =
    r'''
seeds: 79 14 55 13

seed-to-soil map:
50 98 2
52 50 48

soil-to-fertilizer map:
0 15 37
37 52 2
39 0 15

fertilizer-to-water map:
49 53 8
0 11 42
42 0 7
57 7 4

water-to-light map:
88 18 7
18 25 70

light-to-temperature map:
45 77 23
81 45 19
68 64 13

temperature-to-humidity map:
0 69 1
1 0 69

humidity-to-location map:
60 56 37
56 93 4
'''
        .toLinesList();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(exampleInput), equals(35));
    });
    test('Solution', () {
      expect(solveA(input), equals(510109797));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(exampleInput), equals(46));
    });
    test('Solution', () {
      expect(solveB(input), equals(9622622));
    }, skip: true);
  });
}
