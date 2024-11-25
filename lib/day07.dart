// --- Day 7: Camel Cards ---
// https://adventofcode.com/2023/day/7

int solveA(Iterable<String> input) {
  List<Hand> hands = [...input.map(Hand.new)]..sort();
  return hands
      .asMap()
      .entries
      .map((entry) => (entry.key + 1) * entry.value.bid)
      .reduce((a, b) => a + b);
}

int solveB(Iterable<String> input) {
  return 0;
}

class Hand implements Comparable<Hand> {
  final List<String> cards;
  final List<int> cardValues;
  final int bid;
  final TypeOfHand typeOfHand;

  Hand._(this.cards, this.bid)
      : typeOfHand = getTypeOfHand(cards),
        cardValues = [...cards.map((c) => cardValue[c]!)];

  factory Hand(String line) {
    final [cardsString, bidString] = line.split(' ');
    return Hand._(cardsString.split(''), int.parse(bidString));
  }

  static TypeOfHand getTypeOfHand(List<String> cards) {
    Map<String, int> cardCount = {};

    for (String card in cards) {
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
  String toString() => 'Cards: $cards, Bid: $bid, Type: $typeOfHand';

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

const Map<String, int> cardValue = {
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
