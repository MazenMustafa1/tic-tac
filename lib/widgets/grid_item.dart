import 'dart:async';

import 'package:flutter/material.dart';

import '../data.dart';
import '../models/box.dart';

class GridItem extends StatefulWidget {
  const GridItem({super.key, required this.refresh, required this.resetGame});

  final resetGame;
  final refresh;
  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  Box b = Box();

  void select() {
    currentPlayer.addChoice(b.id);
    counter++;
    print('player 1: ${player1.chosen}');
    print('player 2: ${player2.chosen}');
    //switching of players
    setState(() {
      b.pressed = true;
    });
    switchPlayer();
    isPlayer1 ? b.label = letter1 : b.label = letter2;
    isPlayer1 = !isPlayer1;
    widget.refresh(); //to refresh the parent widget

    if (counter >= 5) checkWinner();
  }

  void checkWinner() {
    var conditions = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [1, 5, 9],
      [3, 5, 7],
    ];

    conditions.forEach((element) {
      if (element.every((number) {
            return player1.chosen.contains(number);
          }) ==
          true) {
        setWinner(player1.name + " Won");
        Timer(Duration(milliseconds: 500), () {
          widget.resetGame();
        });
      } else if (element.every((number) => player2.chosen.contains(number)) ==
          true) {
        setWinner(player2.name + " Won");
        Timer(Duration(milliseconds: 500), () {
          widget.resetGame();
        });
      } else if (counter == 9) {
        Timer(Duration(milliseconds: 500), () {
          widget.resetGame();
        });
      }
    });
  }

  void setWinner(name) {
    winner = name;
  }

  void switchPlayer() {
    currentPlayer = isPlayer1 ? player2 : player1;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: b.pressed ? null : select,
        child: Text(
          b.label,
          style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColorDark),
        ));
  }
}
