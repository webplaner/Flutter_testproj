import 'dart:math';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:test_proj/pi_inthesky/pigame.dart';
import 'package:test_proj/pi_inthesky/plate.dart';
import 'package:test_proj/pi_inthesky/score.dart';

class Pie extends SpriteComponent with HasGameRef<PiInTheSkyGame>, CollisionCallbacks {

  late final Score _score;
  late final NextPieValue _nextPieValue;
  late final int _pieIndex;

  Pie({required Score score, required NextPieValue nextPieValue, required int pieIndex})
      : _score = score, _nextPieValue = nextPieValue, _pieIndex = pieIndex;

  final Random _random = Random();
  late int pieNumber;
  late int pieColor;
  late Image image;
  late double velocity;

  final List _colors = ['Blue', 'Orange', 'Pink', 'Yellow'];

  @override
  Future<void>? onLoad() async {
    size = Vector2(70, 70);
    add(CircleHitbox(radius: 35));
    resetPie();
    return super.onLoad();
  }

  resetPie() async {
    position.x = _random.nextDouble() * gameRef.size.x; // - size.x;
    position.x = (position.x <= size.x/2) ? position.x + size.x : position.x;
    position.x = (position.x >= gameRef.size.x - size.x/2) ? gameRef.size.x - size.x : position.x;
    position.y = -100;

    pieNumber = _random.nextInt(10);
    pieColor = _random.nextInt(4);
    velocity = 150 + _random.nextDouble() * 150 * (pieNumber/5 + 1) ;
    velocity = 150 + _random.nextDouble() * 250;
    String color = _colors[pieColor];
    image = await Flame.images.load('Pies/Pie_$color-0$pieNumber.png');
    // size = Vector2(70, 70);
    sprite = Sprite(image);
  }

  @override
  void update(double dt) {
    super.update(dt);
    
    if (_pieIndex >= _score.pieCounts) return;

    position.y += velocity * dt;
    anchor = Anchor.center;
    angle += dt * velocity/180;
    if (position.y >= gameRef.size.y + size.y) {
      resetPie();
    }
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is Plate) {
      if (_nextPieValue.nextValue == pieColor) {
        if (pieNumber == 0) {
          _score.score = (_score.score < 1) ? 0 : _score.score--;
        } else {
          _score.score += pieNumber;
          // _nextPieValue.nextValue = _random.nextInt(4);
        }

        resetPie();
      }
      else {
        if (pieNumber == 0) {
          _score.score = (_score.score < 10) ? 0 : _score.score - 10;
        } else {
          _score.score = (_score.score < pieNumber) ? 0 : _score.score - pieNumber;
        }

        if (_score.score <= 0) {
          resetPie();
          gameOver();
        } else {
          resetPie();
        }
        // gameRef.pauseEngine();
      }
    }
  }

  gameOver() {
    // gameRef.stopListening();
    gameRef.pauseEngine();
    gameRef.overlays.add('gameOver');
  }

  resetPostion() {
    position.y = -100;
  }

}