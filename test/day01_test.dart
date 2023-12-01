// --- Day 1: Trebuchet?! ---
// https://adventofcode.com/2023/day/1

import 'dart:io';
import 'package:advent_of_code_2023/day01.dart';
import 'package:advent_of_code_2023/util.dart';
import 'package:test/test.dart';

final input = File('test/data/day01.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
          solveA('''
1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet
'''
              .asLines),
          equals(142));
    });
    test('Solution', () {
      expect(solveA(input), equals(53974));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(
          solveB('''
two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen          
'''
              .asLines),
          equals(281));
    });
    test('Solution', () {
      expect(solveB(input), equals(52840));
    });
  });
}
