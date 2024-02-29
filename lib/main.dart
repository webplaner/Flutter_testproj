// import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:test_proj/pi_inthesky/gameover.dart';
// import 'package:flame/collisions.dart';
// import 'package:flame/events.dart';
// import 'package:flame/flame.dart';

import 'package:test_proj/pi_inthesky/pigame.dart';

void main() {
  final game = PiInTheSkyGame();

  runApp(GameWidget(
      game: game,
      overlayBuilderMap: {
        'gameOver': (context, _) => GameOverPage(game: game),
      },
  ));
}

// class PiInTheSkyGame extends FlameGame { //}with HasCollisionDetection {
//   PiInTheSkyGame();
//   late Score score;
//
//   @override
//   Future<void> onLoad() async {
//     addAll([
//       Background(),
//       Plate(),
//       score = Score(),
//     ]);
//   }
//
// // late NextPieValue nextPieValue;
// // @override
// // Future<void> onLoad() async {
// //   addAll([
// //     // nextPieValue = NextPieValue(),
// //     // for(int i = 0; i <= 10; i++)
// //     //   Pie(score: score, nextPieValue: nextPieValue),
// //   ]);
// // }
//
// }

// class Background extends SpriteComponent with HasGameRef<PiInTheSkyGame> {
//   Background();
//
//   @override
//   Future<void> onLoad() async {
//     final image = await Flame.images.load('Sky.png');
//     size = gameRef.size;
//     sprite = Sprite(image);
//   }
// }
//
// class Plate extends PositionComponent with HasGameRef<PiInTheSkyGame>, DragCallbacks {
//   Plate();
//
//   @override
//   Future<void> onLoad() async {
//     final image = await Flame.images.load('Plate.png');
//     size = Vector2(80, 20); // image size
//     position = Vector2(gameRef.size.x / 2 - size.x / 2, gameRef.size.y * 0.9);
//
//     addAll([
//       SpriteComponent(sprite: Sprite(image), size: size),
//       RectangleHitbox(),
//     ]);
//   }
//
//   @override
//   void onDragStart(DragStartEvent event) {
//     position.x = event.canvasPosition.x - size.x / 2;
//     return super.onDragStart(event);
//   }
//
//   @override
//   void onDragUpdate(DragUpdateEvent event) {
//     position.x += event.canvasDelta.x;
//     return super.onDragUpdate(event);
//   }
// }
//
// class Score extends TextComponent with HasGameRef<PiInTheSkyGame> {
//   Score();
//   late int score;
//
//   @override
//   Future<void>? onLoad() async {
//     score = 0;
//     // position = Vector2.all(100);
//     // position = Vector2(gameRef.size.x / 2 - size.x / 2, gameRef.size.y * 0.1);
//     // text = score.toString();
//     return super.onLoad();
//   }
//
//   @override
//   void update(double dt) {
//     super.update(dt);
//     text =  score.toString();
//   }
//
//   @override
//   void render(Canvas canvas) {
//     TextPaint(
//       style: const TextStyle(
//         fontSize: 40.0,
//         color: Colors.pinkAccent,
//         fontWeight: FontWeight.w600,
//       ),
//     ).render(canvas, text, Vector2.zero());
//     position = Vector2(gameRef.size.x / 2 - size.x / 2, gameRef.size.y * 0.07);
//   }
//
// }


