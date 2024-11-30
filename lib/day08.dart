// --- Day 8: Haunted Wasteland ---
// https://adventofcode.com/2023/day/8

int solveA(Iterable<String> input) {
  RegExp regExp = RegExp(r'(.+) = \((.+), (.+)\)');
  Map<String, ({String left, String right})> network = {};
  // left = true, right = false
  List<bool>? instructions;

  for (final line in input.where((line) => line.isNotEmpty)) {
    // First line contains instructions
    if (instructions == null) {
      instructions = [...line.split('').map((letter) => letter == 'L')];
      continue;
    }

    final [from, left, right] = regExp.firstMatch(line)!.groups([1, 2, 3]);
    network[from!] = (left: left!, right: right!);
  }
  instructions!;

  var currentPosition = 'AAA';
  var steps = 0;

  while (currentPosition != 'ZZZ') {
    final nextStep = network[currentPosition]!;

    currentPosition = instructions[steps++ % instructions.length]
        ? nextStep.left
        : nextStep.right;
  }

  return steps;
}

int solveB(Iterable<String> input) {
  RegExp regExp = RegExp(r'(.+) = \((.+), (.+)\)');
  Map<String, ({String left, String right})> network = {};
  // left = true, right = false
  List<bool>? instructions;

  for (final line in input.where((line) => line.isNotEmpty)) {
    // First line contains instructions
    if (instructions == null) {
      instructions = [...line.split('').map((letter) => letter == 'L')];
      continue;
    }

    final [from, left, right] = regExp.firstMatch(line)!.groups([1, 2, 3]);
    network[from!] = (left: left!, right: right!);
  }
  instructions!;

  var currentPositions = [...network.keys.where((pos) => pos.endsWith('A'))];
  var steps = 0;

  while (!currentPositions.every((pos) => pos.endsWith('Z'))) {
    final instruction = instructions[steps++ % instructions.length];

    for (var i = 0; i < currentPositions.length; i++) {
      final nextStep = network[currentPositions[i]]!;

      currentPositions[i] = instruction ? nextStep.left : nextStep.right;
    }
  }

  return steps;
}
