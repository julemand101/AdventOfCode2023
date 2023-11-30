// --- Day 1: Calorie Counting ---
// https://adventofcode.com/2022/day/1

import 'dart:io';
import 'package:advent_of_code_2023/day01.dart';
import 'package:test/test.dart';

final input = File('test/data/day01.txt').readAsLinesSync();
const testInput = [
  '1000',
  '2000',
  '3000',
  '',
  '4000',
  '',
  '5000',
  '6000',
  '',
  '7000',
  '8000',
  '9000',
  '',
  '10000',
];

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(testInput), equals(24000));
    });
    test('Solution', () {
      expect(solveA(input), equals(69912));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(testInput), equals(45000));
    });
    test('Solution', () {
      expect(solveB(input), equals(208180));
    });
  });
}
