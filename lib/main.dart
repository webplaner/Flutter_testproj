import 'dart:math' as math;
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';

void main() {
  runApp(GameWidget(game: PiInTheSkyGame()));
}

class PiInTheSkyGame extends FlameGame with HasCollisionDetection {
  PiInTheSkyGame();

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Plate(),
    ]);
  }

// late Score score;
// late NextPieValue nextPieValue;
// @override
// Future<void> onLoad() async {
//   addAll([
//     Background(),
//     // score = Score(),
//     // nextPieValue = NextPieValue(),
//     // for(int i = 0; i <= 10; i++)
//     //   Pie(score: score, nextPieValue: nextPieValue),
//     // Plate(),
//   ]);
// }

}

class Background extends SpriteComponent with HasGameRef<PiInTheSkyGame> {
  Background();

  @override
  Future<void> onLoad() async {
    final image = await Flame.images.load('Sky.png');
    size = gameRef.size;
    sprite = Sprite(image);
  }
}

class Plate extends PositionComponent with HasGameRef<PiInTheSkyGame>, DragCallbacks {
  Plate();

  @override
  Future<void> onLoad() async {
    final image = await Flame.images.load('Plate.png');
    size = Vector2(80, 20); // image size
    position = Vector2(gameRef.size.x / 2 - size.x / 2, gameRef.size.y * 0.9);

    addAll([
      SpriteComponent(sprite: Sprite(image), size: size),
      RectangleHitbox(),
    ]);
  }

  @override
  void onDragStart(DragStartEvent event) {
    position.x = event.canvasPosition.x - size.x / 2;
    return super.onDragStart(event);
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    position.x += event.canvasDelta.x;
    return super.onDragUpdate(event);
  }
}

// class Plate extends PositionComponent with HasGameRef<PiInTheSkyGame>, Draggable {
// class Plate extends PositionComponent with HasGameRef<PiInTheSkyGame> {
//   Plate();
//
//   @override
//   Future<void> onLoad() async {
//     final image = await Flame.images.load('Plate.png');
//     size = Vector2(80, 15);
//     position = Vector2(gameRef.size.x / 2 - size.x / 2, gameRef.size.y * 0.95);
//     addAll([
//       SpriteComponent(sprite: Sprite(image), size: size),
//       RectangleHitbox(),
//     ]);
//   }
//
//   // @override
//   // bool onDragStart(DragStartInfo info) {
//   //   position.x = info.eventPosition.game.x - size.x / 2;
//   //   return super.onDragStart(info);
//   // }
//   //
//   // @override
//   // bool onDragUpdate(DragUpdateInfo info) {
//   //   position.x = info.eventPosition.game.x - size.x / 2;
//   //   return super.onDragUpdate(info);
//   // }
// }