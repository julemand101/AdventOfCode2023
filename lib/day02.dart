// --- Day 2: Cube Conundrum ---
// https://adventofcode.com/2023/day/2

import 'dart:math';

import 'package:collection/collection.dart';

int solveA(Iterable<String> input) => input
    .map(parse)
    .where(
      (game) => game.sets.every(
        (set) => set.red <= 12 && set.green <= 13 && set.blue <= 14,
      ),
    )
    .fold(0, (sum, game) => sum + game.id);

int solveB(Iterable<String> input) => input
    .map(parse)
    .map(
      (game) => game.sets.reduce(
        (g1, g2) => (
          red: max(g1.red, g2.red),
          green: max(g1.green, g2.green),
          blue: max(g1.blue, g2.blue),
        ),
      ),
    )
    .map((e) => e.red * e.green * e.blue)
    .sum;

final regExp = RegExp(r'(\d+) (red|green|blue)');

({int id, Iterable<({int red, int green, int blue})> sets}) parse(String line) {
  final [gameIdString, rest] = line.substring('Game '.length).split(': ');

  return (
    id: int.parse(gameIdString),
    sets: rest.split('; ').map((e) => regExp.allMatches(e)).map((matches) {
      var red = 0, green = 0, blue = 0;

      for (final match in matches) {
        final amount = int.parse(match[1]!);

        switch (match[2]) {
          case 'red':
            red = amount;
          case 'green':
            green = amount;
          case 'blue':
            blue = amount;
          default:
            throw Exception('${match[2]} is not a know color!');
        }
      }

      return (red: red, green: green, blue: blue);
    }),
  );
}
