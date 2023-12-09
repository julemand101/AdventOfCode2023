// --- Day 4: Scratchcards ---
// https://adventofcode.com/2023/day/4

import 'package:collection/collection.dart';

int solveA(Iterable<String> input) => input
    .map(parse)
    .map((card) =>
        1 << card.winningNumbers.intersection(card.numbersYouHave).length >> 1)
    .sum;

int solveB(Iterable<String> input) {
  return 0;
}

RegExp regExp = RegExp(r'Card +(\d+): (.*) \| (.*)');

({
  int cardId,
  Set<int> winningNumbers,
  Set<int> numbersYouHave,
}) parse(String line) {
  final match = regExp.firstMatch(line)!;

  return (
    cardId: int.parse(match[1]!),
    winningNumbers: match[2]!
        .split(' ')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .map(int.parse)
        .toSet(),
    numbersYouHave: match[3]!
        .split(' ')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .map(int.parse)
        .toSet(),
  );
}