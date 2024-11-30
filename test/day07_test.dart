// --- Day 7: Camel Cards ---
// https://adventofcode.com/2023/day/7

import 'dart:io';
import 'package:advent_of_code_2023/day07.dart';
import 'package:advent_of_code_2023/util.dart';
import 'package:test/test.dart';

final input = File('test/data/day07.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
          solveA(r'''
32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483
'''
              .asLines),
          equals(6440));
    });
    test('Solution', () {
      expect(solveA(input), equals(241344943));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(
          solveB(r'''
32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483
'''
              .asLines),
          equals(5905));
    });
    test('Solution', () {
      expect(solveB(input), equals(243101568));
    });
  });
}
