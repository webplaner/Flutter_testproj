// import 'dart:ui';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:test_proj/pi_inthesky/pigame.dart';

class Score extends TextComponent with HasGameRef<PiInTheSkyGame>  {
  Score();

  late int score;
  late int gameLevel = 1;
  late int pieCounts = 3;

  @override
  Future<void>? onLoad() async {
    score = 10;
    gameLevel = 1;
    pieCounts = 3;


    // position = Vector2.all(100);
    text = score.toString();
    position = Vector2(50, gameRef.size.y * 0.07);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    text =  score.toString();
  }

  @override
  void render(Canvas canvas) {
    TextPaint(
      style: const TextStyle(
        fontSize: 40.0,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    ).render(canvas, text, Vector2.zero());
    //position = Vector2(gameRef.size.x / 2 - size.x / 2, gameRef.size.y * 0.07);
  }
}

class NextPieValue extends TextComponent with HasGameRef<PiInTheSkyGame> {
  NextPieValue();

  late int nextValue;
  final List _colors = ['Blue', 'Orange', 'Pink', 'Yellow'];

  @override
  Future<void>? onLoad() async {
    nextValue = Random().nextInt(4); //;int.parse(text.substring(0, 1));
    text = _colors[nextValue].toString();
    position = Vector2(gameRef.size.x - 100, gameRef.size.y * 0.07 + 20);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    // nextValue = int.parse(text.substring(0, 1));
    text = _colors[nextValue].toString();
  }

  @override
  void render(Canvas canvas) {
    TextPaint(
      style: const TextStyle(
        fontSize: 20.0,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    ).render(canvas, text, Vector2.zero());
    // position = Vector2(gameRef.size.x / 2 - size.x / 2, gameRef.size.y * 0.07 + 60);
  }
}