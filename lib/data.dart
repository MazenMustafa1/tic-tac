import 'models/player.dart';

String letter1 = 'X';
String letter2 = 'O';

bool isPlayer1 = true;
int counter = 0;
String winner = 'Draw';
bool gameOver = false;

Player player1 = Player('Player 1');
Player player2 = Player('Player 2');
Player currentPlayer = player1;
