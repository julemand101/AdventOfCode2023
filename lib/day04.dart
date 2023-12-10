// --- Day 4: Scratchcards ---
// https://adventofcode.com/2023/day/4

import 'package:collection/collection.dart';

int solveA(Iterable<String> input) => input
    .map(parse)
    .map((card) =>
        1 << card.winningNumbers.intersection(card.numbersYouHave).length >> 1)
    .sum;

int solveB(Iterable<String> input) {
  List<int> cards = List.generate(input.length, (_) => 1, growable: false);

  for (final (i, card) in input.map(parse).indexed) {
    final score = card.winningNumbers.intersection(card.numbersYouHave).length;

    for (var k = 1; k <= score && i + k < cards.length; k++) {
      cards[i + k] += cards[i];
    }
  }

  return cards.sum;
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
