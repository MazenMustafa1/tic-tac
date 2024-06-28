import 'package:flutter/material.dart';

class WinnerScreen extends StatelessWidget {
  const WinnerScreen(
      {super.key, required this.winnerName, required this.playAgain});

  final playAgain;
  final winnerName;
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            winnerName,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          TextButton(
              onPressed: playAgain,
              child: Text(
                "Play Again",
                style: TextStyle(fontSize: 18),
              ))
        ],
      ),
    );
  }
}
