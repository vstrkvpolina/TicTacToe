import 'package:flutter/material.dart';
import 'package:tictactoe/styles.dart';

void main() {
  runApp(const TicTacToe());
}

class TicTacToe extends StatelessWidget {
  const TicTacToe({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe', // I tip-tip-tip-tip toe in this ..
      theme: ThemeData(
        //ThemeData.dark()
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 242, 242, 224)),
        useMaterial3: true,
      ),
      home: const TicTacToePage(title: 'Tic Tac Toe'),
    );
  }
}

class TicTacToePage extends StatefulWidget {
  const TicTacToePage({super.key, required this.title});

  final String title;

  @override
  State<TicTacToePage> createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  bool isTurn = true;
  int oScore = 0;
  int xScore = 0;
  int count = 0;

  List<String> changeXO = [
    '', // 1
    '', // 2
    '', // 3
    '', // 4
    '', // 5
    '', // 6
    '', // 7
    '', // 8
    '', // 9
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Player X',
                          style: txtStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          xScore.toString(),
                          style: txtStyle,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Player O',
                          style: txtStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          oScore.toString(),
                          style: txtStyle,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ))
          ],
        ));
  }

  void SetXor0() {}

  void checkWinner() {}

  void _showDialog() {}

  void _clearBoard() {}
}
