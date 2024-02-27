import 'dart:math';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/animation.dart';
import 'package:test_proj/pi_inthesky/pigame.dart';
import 'package:test_proj/pi_inthesky/plate.dart';
import 'package:test_proj/pi_inthesky/score.dart';

class Pie extends SpriteComponent with HasGameRef<PiInTheSkyGame>, CollisionCallbacks {
  late final Score _score;
  late final NextPieValue _nextPieValue;

  Pie({required Score score, required NextPieValue nextPieValue})
      : _score = score, _nextPieValue = nextPieValue;

  final Random _random = Random();
  late int pieNumber;
  late int pieColor;
  late Image image;
  late double velocity;

  final List _colors = ['Blue', 'Orange', 'Pink', 'Yellow'];

  @override
  Future<void>? onLoad() async {
    resetPie();
    // image = await Flame.images.load('Pies/Pie_Blue-08.png');
    // size = Vector2(70, 70);
    // sprite = Sprite(image);
    add(CircleHitbox(radius: 35));

    return super.onLoad();
  }

  resetPie() async {
    position.x = _random.nextDouble() * gameRef.size.x; // - size.x;
    position.x = (position.x <= size.x/2) ? position.x + size.x : position.x;
    position.x = (position.x >= gameRef.size.x - size.x/2) ? gameRef.size.x - size.x : position.x;
    position.y = _random.nextDouble() * -100;

    pieNumber = _random.nextInt(10);
    pieColor = _random.nextInt(4);
    velocity = 150 + _random.nextDouble() * 150 * (pieNumber/5 + 1) ;
    velocity = 150 + _random.nextDouble() * 250;
    String color = _colors[pieColor];
    image = await Flame.images.load('Pies/Pie_$color-0$pieNumber.png');
    size = Vector2(70, 70);
    sprite = Sprite(image);
  }

  @override
  void update(double dt) {
    super.update(dt);
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

        resetPie();
        // gameRef.pauseEngine();
      }
    }
  }

}