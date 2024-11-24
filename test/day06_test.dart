// --- Day 6: Wait For It ---
// https://adventofcode.com/2023/day/6

import 'dart:io';
import 'package:advent_of_code_2023/day06.dart';
import 'package:advent_of_code_2023/util.dart';
import 'package:test/test.dart';

final input = File('test/data/day06.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
          solveA(r'''
Time:      7  15   30
Distance:  9  40  200
'''
              .asLines),
          equals(288));
    });
    test('Solution', () {
      expect(solveA(input), equals(293046));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(
          solveB(r'''
Time:      7  15   30
Distance:  9  40  200
'''
              .asLines),
          equals(71503));
    });
    test('Solution', () {
      expect(solveB(input), equals(35150181));
    });
  });
}
