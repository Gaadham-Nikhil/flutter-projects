import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const TicTacToe(),
    );
  }
}

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  String  gameWinner = '' ;
  bool isCrossTurn = false;
  List gameState = List.filled(9, 'empty');

  void checkWinner() {
    if (gameState[0] == gameState[1] &&
        gameState[0] == gameState[2] &&
        gameState[0] != 'empty') {
      gameWinner = '${gameState[0]} won the game! 🥳';
    } else if (gameState[3] != 'empty' &&
        gameState[3] == gameState[4] &&
        gameState[4] == gameState[5]) {
      gameWinner = '${gameState[3]} won the game! 🥳';
    } else if (gameState[6] != 'empty' &&
        gameState[6] == gameState[7] &&
        gameState[7] == gameState[8]) {
      gameWinner = '${gameState[6]} won the game! 🥳';
    } else if (gameState[0] != 'empty' &&
        gameState[0] == gameState[3] &&
        gameState[3] == gameState[6]) {
      '${gameState[0]} won the game! 🥳';
    } else if (gameState[1] != 'empty' &&
        gameState[1] == gameState[4] &&
        gameState[4] == gameState[7]) {
      gameWinner = '${gameState[1]} won the game! 🥳';
    } else if (gameState[2] != 'empty' &&
        gameState[2] == gameState[5] &&
        gameState[5] == gameState[8]) {
      gameWinner = '${gameState[2]} won the game! 🥳';
    } else if (gameState[0] != 'empty' &&
        gameState[0] == gameState[4] &&
        gameState[4] == gameState[8]) {
      gameWinner = '${gameState[0]} won the game! 🥳';
    } else if (gameState[2] != 'empty' &&
        gameState[2] == gameState[4] &&
        gameState[4] == gameState[6]) {
      gameWinner = '${gameState[2]} won the game! 🥳';
    } else if (!gameState.contains('empty')) {
      gameWinner = 'Draw game... ⌛';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Tic Tac Toe",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.red,
        ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: Center(
                child: Text(
                  isCrossTurn? "Player-Chance: X" : "Player-Chance: O" 
                ),
              ),
            ),
          ),
          Expanded(
              child: GridView.builder(
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                if(gameState[index] == 'empty'){
                  gameState[index] = isCrossTurn ? 'cross':'circle';
                  isCrossTurn = !isCrossTurn;
                  setState(() {});
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cell is already filled')));
                }
                checkWinner();
              },
              child: TicTacToeCell(value : gameState[index])
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)
                  )),
                  fixedSize: const WidgetStatePropertyAll(Size(250, 50)),
                  backgroundColor: const WidgetStatePropertyAll(Colors.blue),
                ),
                onPressed: () {},
                child: const Text(
                  "Reload Game",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
          )
        ],
      ),
    );
  }
}

class TicTacToeCell extends StatelessWidget {
  final String value;
  const TicTacToeCell({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    Icon cellIcon;
    switch (value) {
      case 'cross':
        cellIcon = const Icon(Icons.close_outlined);
        break;
      case 'circle':
        cellIcon = const Icon(Icons.circle_outlined);
      default:
      cellIcon = const Icon(Icons.edit);
    }
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
      child: Center(child: cellIcon)
    );
  }
}
