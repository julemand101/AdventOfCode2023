// --- Day 3: Gear Ratios ---
// https://adventofcode.com/2023/day/3

import 'dart:io';
import 'package:advent_of_code_2023/day03.dart';
import 'package:advent_of_code_2023/util.dart';
import 'package:test/test.dart';

final input = File('test/data/day03.txt').readAsLinesSync();
final exampleInput = r'''
467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..
'''
    .toLinesList();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(exampleInput), equals(4361));
    });
    test('Solution', () {
      expect(solveA(input), equals(539713));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(exampleInput), equals(467835));
    });
    test('Solution', () {
      expect(solveB(input), equals(84159075));
    });
  });
}
