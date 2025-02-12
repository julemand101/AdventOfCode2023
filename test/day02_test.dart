// --- Day 2: Cube Conundrum ---
// https://adventofcode.com/2023/day/2

import 'dart:io';
import 'package:advent_of_code_2023/day02.dart';
import 'package:advent_of_code_2023/util.dart';
import 'package:test/test.dart';

final input = File('test/data/day02.txt').readAsLinesSync();
final exampleInput =
    r'''
Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green    
'''.toLinesList();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(exampleInput), equals(8));
    });
    test('Solution', () {
      expect(solveA(input), equals(1867));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(exampleInput), equals(2286));
    });
    test('Solution', () {
      expect(solveB(input), equals(84538));
    });
  });
}
