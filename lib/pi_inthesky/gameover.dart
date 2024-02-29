import 'package:test_proj/pi_inthesky/pigame.dart';
import 'package:flutter/material.dart';

class GameOverPage extends StatelessWidget {
  final PiInTheSkyGame game;

  const GameOverPage({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Game Over',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {               
                game.restartGame();
                game.overlays.removeAll(['gameOver']);      
                game.resumeEngine();          
              },
              child: const Text(
                'Restart',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );


    // throw UnimplementedError();
  }

}
