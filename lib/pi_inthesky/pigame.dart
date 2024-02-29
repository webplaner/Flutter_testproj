
import 'package:flame/game.dart';
import 'package:test_proj/pi_inthesky/background.dart';
import 'package:test_proj/pi_inthesky/score.dart';
import 'package:test_proj/pi_inthesky/plate.dart';
import 'package:test_proj/pi_inthesky/Pie.dart';

class PiInTheSkyGame extends FlameGame with HasCollisionDetection {
  PiInTheSkyGame();

  final int pieMaxcounts = 10;
  late Score score;
  late NextPieValue nextPieValue;
  late List<Pie> pies = [ for(int pi = 0; pi < pieMaxcounts; pi++) Pie(score: score, nextPieValue: nextPieValue, pieIndex: pi) ];
  late Plate plate;

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      score = Score(),
      nextPieValue = NextPieValue(),
      for(int i = 0; i < pieMaxcounts; i++) pies[i],
      plate = Plate(),
    ]);
  }

  restartGame() {
    score.score = 10;
    score.gameLevel = 1;
    score.pieCounts = 3;

    plate.resetPostion();
    for(int i = 0; i < pieMaxcounts; i++) {
      pies[i].resetPostion();
    }
  }



}