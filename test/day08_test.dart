// --- Day 8: Haunted Wasteland ---
// https://adventofcode.com/2023/day/8

import 'dart:io';
import 'package:advent_of_code_2023/day08.dart';
import 'package:advent_of_code_2023/util.dart';
import 'package:test/test.dart';

final input = File('test/data/day08.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
          solveA(r'''
RL

AAA = (BBB, CCC)
BBB = (DDD, EEE)
CCC = (ZZZ, GGG)
DDD = (DDD, DDD)
EEE = (EEE, EEE)
GGG = (GGG, GGG)
ZZZ = (ZZZ, ZZZ)
'''
              .asLines),
          equals(2));
    });
    test('Example 2', () {
      expect(
          solveA(r'''
LLR

AAA = (BBB, BBB)
BBB = (AAA, ZZZ)
ZZZ = (ZZZ, ZZZ)
'''
              .asLines),
          equals(6));
    });
    test('Solution', () {
      expect(solveA(input), equals(19631));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(
          solveB(r'''
LR

11A = (11B, XXX)
11B = (XXX, 11Z)
11Z = (11B, XXX)
22A = (22B, XXX)
22B = (22C, 22C)
22C = (22Z, 22Z)
22Z = (22B, 22B)
XXX = (XXX, XXX)
'''
              .asLines),
          equals(6));
    });
    test('Solution', () {
      expect(solveB(input), equals(21003205388413));
    });
  });
}
