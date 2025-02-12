// --- Day 9: Mirage Maintenance ---
// https://adventofcode.com/2023/day/9

import 'dart:io';
import 'package:advent_of_code_2023/day09.dart';
import 'package:advent_of_code_2023/util.dart';
import 'package:test/test.dart';

final input = File('test/data/day09.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(
          r'''
0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45
'''.asLines,
        ),
        equals(114),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(1861775706));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(
        solveB(
          r'''
0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45
'''.asLines,
        ),
        equals(2),
      );
    });
    test('Solution', () {
      expect(solveB(input), equals(1082));
    });
  });
}
