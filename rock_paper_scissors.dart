// Two-Player Rock, Paper, Scissors game
// Prompts each player for a choice and determines the winner

import 'dart:io';

final List<String> JCVvalidMoves = ['rock', 'paper', 'scissors'];

// Ask for the player's name.
String JCVgetPlayerName(int JCVnumber) {
  stdout.write('Enter Player $JCVnumber name: ');
  String? JCVinput = stdin.readLineSync()?.trim();

  if (JCVinput == null || JCVinput.isEmpty) {
    print('(No name entered. Using "Player $JCVnumber".)');
    return 'Player $JCVnumber';
  }

  return JCVinput;
}

// Check the player's input.
String? JCVvalidateMove(String? JCVinput) {
  String JCVmove = JCVinput?.trim().toLowerCase() ?? '';
  return JCVvalidMoves.contains(JCVmove) ? JCVmove : null;
}

// Get the player's choice.
String JCVgetMove(String JCVname) {
  String? JCVmove;

  do {
    stdout.write(
      '$JCVname, enter your move (rock/paper/scissors): ',
    );

    JCVmove = JCVvalidateMove(stdin.readLineSync());

    if (JCVmove == null) {
      print('Invalid move. Please type rock, paper, or scissors.');
    }
  } while (JCVmove == null);

  return JCVmove;
}

// Check who won.
int JCVdecideWinner(String JCVfirst, String JCVsecond) {
  if (JCVfirst == JCVsecond) return 0;

  switch (JCVfirst) {
    case 'rock':
      return JCVsecond == 'scissors' ? 1 : 2;

    case 'paper':
      return JCVsecond == 'rock' ? 1 : 2;

    default:
      return JCVsecond == 'paper' ? 1 : 2;
  }
}

void main() {
  print('===== ROCK, PAPER, SCISSORS =====');

  String JCVplayerOne = JCVgetPlayerName(1);
  String JCVplayerTwo = JCVgetPlayerName(2);

  int JCVplayerOneScore = 0;
  int JCVplayerTwoScore = 0;
  int JCVround = 0;

  String? JCVagain;

  do {
    print('\n--- Round ${++JCVround} ---');

    String JCVmoveOne = JCVgetMove(JCVplayerOne);

    // Clear the first player's choice.
    for (int JCVi = 0; JCVi < 30; JCVi++) {
      print('');
    }

    String JCVmoveTwo = JCVgetMove(JCVplayerTwo);

    int JCVresult = JCVdecideWinner(JCVmoveOne, JCVmoveTwo);

    String? JCVwinner;

    if (JCVresult == 1) {
      JCVwinner = '$JCVplayerOne wins the round!';
      JCVplayerOneScore++;
    } else if (JCVresult == 2) {
      JCVwinner = '$JCVplayerTwo wins the round!';
      JCVplayerTwoScore++;
    }

    print(
      '$JCVplayerOne chose $JCVmoveOne. '
      '$JCVplayerTwo chose $JCVmoveTwo.',
    );

    print('Result: ${JCVwinner ?? "It\'s a draw!"}');

    print(
      'Score -> $JCVplayerOne: $JCVplayerOneScore | '
      '$JCVplayerTwo: $JCVplayerTwoScore',
    );

    stdout.write('Play again? (y/n): ');
    JCVagain = stdin.readLineSync();
  } while (JCVagain?.trim().toLowerCase() != 'n');

  // Find the final winner.
  String? JCVoverall = JCVplayerOneScore > JCVplayerTwoScore
      ? JCVplayerOne
      : JCVplayerTwoScore > JCVplayerOneScore
          ? JCVplayerTwo
          : null;

  print('\n===== FINAL SCORE =====');

  print(
    '$JCVplayerOne: $JCVplayerOneScore | '
    '$JCVplayerTwo: $JCVplayerTwoScore',
  );

  print(
    'Overall winner: ${JCVoverall ?? "It\'s a draw!"}',
  );
}