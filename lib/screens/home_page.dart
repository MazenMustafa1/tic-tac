import 'package:flutter/material.dart';

import '../data.dart';
import '../models/box.dart';
import './winning_screen.dart';
import '../widgets/grid_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void refresh() {
    setState(() {});
  }

  void resetGame() {
    print('Winner is: $winner');
    setState(() {
      gameOver = true;
      counter = 0;
      currentPlayer = player1;
      player1.chosen.clear();
      player2.chosen.clear();
      isPlayer1 = true;
    });
  }

  void playAgain() {
    setState(() {
      gameOver = false;
      winner = 'Draw';
      Box.counter = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: gameOver
            ? WinnerScreen(
                winnerName: winner,
                playAgain: playAgain,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    Text(
                      isPlayer1 ? player1.name : player2.name,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 7,
                      mainAxisSpacing: 7,
                      shrinkWrap: true,
                      children: [
                        GridItem(
                          refresh: refresh,
                          resetGame: resetGame,
                        ),
                        GridItem(
                          refresh: refresh,
                          resetGame: resetGame,
                        ),
                        GridItem(
                          refresh: refresh,
                          resetGame: resetGame,
                        ),
                        GridItem(
                          refresh: refresh,
                          resetGame: resetGame,
                        ),
                        GridItem(
                          refresh: refresh,
                          resetGame: resetGame,
                        ),
                        GridItem(
                          refresh: refresh,
                          resetGame: resetGame,
                        ),
                        GridItem(
                          refresh: refresh,
                          resetGame: resetGame,
                        ),
                        GridItem(
                          refresh: refresh,
                          resetGame: resetGame,
                        ),
                        GridItem(
                          refresh: refresh,
                          resetGame: resetGame,
                        ),
                      ],
                    ),
                  ]));
  }
}
