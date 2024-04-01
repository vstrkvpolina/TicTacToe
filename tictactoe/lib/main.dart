import 'package:flutter/material.dart';
import 'package:tictactoe/styles.dart';

void main() {
  runApp(const TicTacToe());
}

class TicTacToe extends StatelessWidget {
  const TicTacToe({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 35, 3, 12)),
        useMaterial3: true,
      ),
      home: const TicTacToePage(title: 'Tic Tac Toe'),
    );
  }
}

class TicTacToePage extends StatefulWidget {
  const TicTacToePage({Key? key, required this.title});

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
    '', '', '', '', '', '', '', '', '',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: changeXO.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (BuildContext ctx, int index) {
                  return GestureDetector(
                    onTap: () => _setXor0(index),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 10, 1, 1),
                        ),
                      ),
                      child: Center(
                        child: Text(changeXO[index], style: xoStyle),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _setXor0(int index) {
    if (isTurn && changeXO[index] == '') {
      setState(() {
        changeXO[index] = 'o';
        isTurn = !isTurn;
      });
    } else if (!isTurn && changeXO[index] == '') {
      setState(() {
        changeXO[index] = 'x';
        isTurn = !isTurn;
      });
    }

    count++;
    _checkWinner();
  }

  void _checkWinner() {
    if (changeXO[0] == changeXO[1] &&
        changeXO[0] == changeXO[2] &&
        changeXO[0] != '') {
      _showDialog(winner : changeXO[0]);
    }
    if (changeXO[3] == changeXO[4] &&
        changeXO[3] == changeXO[5] &&
        changeXO[3] != '') {
      _showDialog(winner : changeXO[3]);
    }
    if (changeXO[6] == changeXO[7] &&
        changeXO[6] == changeXO[8] &&
        changeXO[6] != '') {
      _showDialog(winner : changeXO[6]);
    }
    if (changeXO[0] == changeXO[3] &&
        changeXO[0] == changeXO[6] &&
        changeXO[0] != '') {
      _showDialog(winner : changeXO[0]);
    }
    if (changeXO[1] == changeXO[4] &&
        changeXO[1] == changeXO[7] &&
        changeXO[1] != '') {
      _showDialog(winner : changeXO[1]);
    }
    if (changeXO[2] == changeXO[5] &&
        changeXO[2] == changeXO[8] &&
        changeXO[2] != '') {
      _showDialog(winner : changeXO[2]);
    }
    if (changeXO[0] == changeXO[4] &&
        changeXO[0] == changeXO[8] &&
        changeXO[0] != '') {
      _showDialog(winner : changeXO[0]);
    }
    if (changeXO[2] == changeXO[4] &&
        changeXO[2] == changeXO[6] &&
        changeXO[2] != '') {
      _showDialog(winner : changeXO[2]);
    }

    if (count == 9) {
      _showDialog(winnerExist: false);
      _clearBoard();
    }
  }


  void _showDialog({String winner = '', bool winnerExist = true}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(winnerExist ? 'Winner: $winner' : 'No winner, you\'re dumbass '),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Another game?'))
            ],
          );
        });

    count = 0;
    _clearBoard();
    if (winner == 'o') {
      setState(() {
        oScore++;
      });
    } else if (winner == 'x') {
      xScore++;
    }
  }

  void _clearBoard() {
    for (int i = 0; i < 9; i++) {
      changeXO[i] = '';
    }
  }
}



// import 'package:flutter/material.dart';
// import 'package:tictactoe/styles.dart';

// void main() {
//   runApp(const TicTacToe());
// }

// class TicTacToe extends StatelessWidget {
//   const TicTacToe({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Tic Tac Toe', // I tip-tip-tip-tip toe in this ..
//       theme: ThemeData(
//         //ThemeData.dark()
//         colorScheme:
//             ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 35, 3, 12)),
//         useMaterial3: true,
//       ),
//       home: const TicTacToePage(title: 'Tic Tac Toe'),
//     );
//   }
// }

// class TicTacToePage extends StatefulWidget {
//   const TicTacToePage({super.key, required this.title});

//   final String title;

//   @override
//   State<TicTacToePage> createState() => _TicTacToePageState();
// }

// class _TicTacToePageState extends State<TicTacToePage> {
//   bool isTurn = true;
//   int oScore = 0;
//   int xScore = 0;
//   int count = 0;

//   List<String> changeXO = [
//     '', // 1
//     '', // 2
//     '', // 3
//     '', // 4
//     '', // 5
//     '', // 6
//     '', // 7
//     '', // 8
//     '', // 9
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//           title: Text(widget.title),
//         ),
//         body: Column(
//           children: [
//             Expanded(
//                 child: Padding(
//               padding: const EdgeInsets.all(25.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     children: [
//                       const Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text(
//                           'Player X',
//                           style: txtStyle,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           xScore.toString(),
//                           style: txtStyle,
//                         ),
//                       )
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       const Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text(
//                           'Player O',
//                           style: txtStyle,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           oScore.toString(),
//                           style: txtStyle,
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             )),
//             Expanded(
//                 flex: 3,
//                 child: GridView.builder(
//                     itemCount: changeXO.length,
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 3),
//                     itemBuilder: (BuildContext ctx, int index) {
//                       return GestureDetector(
//                         onTap: () => _setXor0(index),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               border: Border.all(
//                                   color: const Color.fromARGB(255, 10, 1, 1))),
//                           child: Center(
//                             child: Text(changeXO[index], style: xoStyle),
//                           ),
//                         ),
//                       );
//                     })),
//           ],
//         ));
//   }

//   void _setXor0(int index) {
//     if (isTurn && changeXO[index] == '') {
//       // что за хрень
//       setState(() {
//         changeXO[index] = 'o';
//         isTurn = !isTurn;
//       });
//     } else if (!isTurn && changeXO[index] == '') {
//       setState(() {
//         changeXO[index] = 'x';
//         isTurn = !isTurn;
//       });
//     }

//     count++;
//     _checkWinner();
//   }

//   void _checkWinner() {
//     if (changeXO[0] == changeXO[1] &&
//         changeXO[0] == changeXO[2] &&
//         changeXO[0] != '') {
//       _showDialog(winner : changeXO[0]);
//     }
//     if (changeXO[3] == changeXO[4] &&
//         changeXO[3] == changeXO[5] &&
//         changeXO[3] != '') {
//       _showDialog(winner : changeXO[3]);
//     }
//     if (changeXO[6] == changeXO[7] &&
//         changeXO[6] == changeXO[8] &&
//         changeXO[6] != '') {
//       _showDialog(winner : changeXO[6]);
//     }
//     if (changeXO[0] == changeXO[3] &&
//         changeXO[0] == changeXO[6] &&
//         changeXO[0] != '') {
//       _showDialog(winner : changeXO[0]);
//     }
//     if (changeXO[1] == changeXO[4] &&
//         changeXO[1] == changeXO[7] &&
//         changeXO[1] != '') {
//       _showDialog(winner : changeXO[1]);
//     }
//     if (changeXO[2] == changeXO[5] &&
//         changeXO[2] == changeXO[8] &&
//         changeXO[2] != '') {
//       _showDialog(winner : changeXO[2]);
//     }
//     if (changeXO[0] == changeXO[4] &&
//         changeXO[0] == changeXO[8] &&
//         changeXO[0] != '') {
//       _showDialog(winner : changeXO[0]);
//     }
//     if (changeXO[2] == changeXO[4] &&
//         changeXO[2] == changeXO[6] &&
//         changeXO[2] != '') {
//       _showDialog(winner : changeXO[2]);
//     }

//     if (count == 9) {
//       _showDialog(winnerExist: false);
//       _clearBoard();
//     }
//   }

  // void _showDialog({String winner = '', bool winnerExist = true}) {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text(winnerExist ? 'Winner: $winner' : 'No winner already'),
  //           actions: [
  //             TextButton(
  //                 onPressed: () => Navigator.of(context).pop(),
  //                 child: const Text('Another game?'))
  //           ],
  //         );
  //       });

  //   count = 0;
  //   _clearBoard();
  //   if (winner == 'o') {
  //     setState(() {
  //       oScore++;
  //     });
  //   } else if (winner == 'x') {
  //     xScore++;
  //   }
  // }

//   void _clearBoard() {
//     for (int i = 0; i < 9; i++) {
//       changeXO[i] = '';
//     }
//   }
// }
