// --- Day 7: Camel Cards ---
// https://adventofcode.com/2023/day/7

int solveA(Iterable<String> input) => ([...input.map(Hand.part1)]..sort())
    .asMap()
    .entries
    .map((entry) => (entry.key + 1) * entry.value.bid)
    .reduce((a, b) => a + b);

int solveB(Iterable<String> input) => ([...input.map(Hand.part2)]..sort())
    .asMap()
    .entries
    .map((entry) => (entry.key + 1) * entry.value.bid)
    .reduce((a, b) => a + b);

class Hand implements Comparable<Hand> {
  final List<int> cardValues;
  final int bid;
  final TypeOfHand typeOfHand;

  Hand._(this.cardValues, this.bid, this.typeOfHand);

  factory Hand.part1(String line) {
    const cardValueMap = {
      'A': 14,
      'K': 13,
      'Q': 12,
      'J': 11,
      'T': 10,
      '9': 9,
      '8': 8,
      '7': 7,
      '6': 6,
      '5': 5,
      '4': 4,
      '3': 3,
      '2': 2,
    };
    final [cardsString, bidString] = line.split(' ');
    final cardValues = [
      ...cardsString.split('').map((card) => cardValueMap[card]!)
    ];

    return Hand._(cardValues, int.parse(bidString), getTypeOfHand(cardValues));
  }

  factory Hand.part2(String line) {
    const cardValueMap = {
      'A': 13,
      'K': 12,
      'Q': 11,
      'T': 10,
      '9': 9,
      '8': 8,
      '7': 7,
      '6': 6,
      '5': 5,
      '4': 4,
      '3': 3,
      '2': 2,
      'J': 1,
    };
    final [cardsString, bidString] = line.split(' ');
    final cardValues = [
      ...cardsString.split('').map((card) => cardValueMap[card]!)
    ];

    // Find best hand by change J to different other cards
    var typeOfBestHand = getTypeOfHand(cardValues);
    for (var i = 1; i <= 13; i++) {
      if (getTypeOfHand(cardValues.map((card) => card == 1 ? card + i : card))
          case final newTypeOfHand
          when newTypeOfHand.value > typeOfBestHand.value) {
        typeOfBestHand = newTypeOfHand;
      }
    }

    return Hand._(cardValues, int.parse(bidString), typeOfBestHand);
  }

  static TypeOfHand getTypeOfHand(Iterable<int> cards) {
    Map<int, int> cardCount = {};

    for (int card in cards) {
      cardCount.update(card, (i) => i + 1, ifAbsent: () => 1);
    }

    // Five of a kind
    if (cardCount.length == 1) {
      return TypeOfHand.fiveOfAKind;
    }

    if ([...cardCount.values] case [final aCards, final bCards]) {
      // Four of a kind
      if (aCards == 4 || bCards == 4) {
        return TypeOfHand.fourOfAKind;
      }

      // Full house
      if ((aCards == 3 && bCards == 2) || (aCards == 2 && bCards == 3)) {
        return TypeOfHand.fullHouse;
      }
    }

    if ([...cardCount.values] case [final aCards, final bCards, final cCards]) {
      // Three of a kind
      if (aCards == 3 || bCards == 3 || cCards == 3) {
        return TypeOfHand.threeOfAKind;
      }

      // Two pair
      if ((aCards == 2 && bCards == 2 && cCards == 1) ||
          (aCards == 2 && bCards == 1 && cCards == 2) ||
          (aCards == 1 && bCards == 2 && cCards == 2)) {
        return TypeOfHand.twoPair;
      }
    }

    // One pair
    if (cardCount.length == 4 && cardCount.values.any((i) => i == 2)) {
      return TypeOfHand.onePair;
    }

    // High card
    if (cards.toSet().length == 5) {
      return TypeOfHand.highCard;
    }

    throw Exception('Could not detect type of hand of: $cards');
  }

  @override
  int compareTo(Hand other) {
    int compareHand = typeOfHand.value.compareTo(other.typeOfHand.value);

    if (compareHand != 0) {
      return compareHand;
    } else {
      for (var i = 0; i < cardValues.length; i++) {
        int compareCard = cardValues[i].compareTo(other.cardValues[i]);

        if (compareCard != 0) {
          return compareCard;
        }
      }
    }

    throw Exception('Could not compare $this with $other');
  }
}

enum TypeOfHand {
  fiveOfAKind(7),
  fourOfAKind(6),
  fullHouse(5),
  threeOfAKind(4),
  twoPair(3),
  onePair(2),
  highCard(1);

  final int value;
  const TypeOfHand(this.value);
}
