import 'package:flame/game.dart';
import 'package:test_proj/pi_inthesky/background.dart';
import 'package:test_proj/pi_inthesky/score.dart';
import 'package:test_proj/pi_inthesky/plate.dart';
import 'package:test_proj/pi_inthesky/Pie.dart';

class PiInTheSkyGame extends FlameGame with HasCollisionDetection {
  PiInTheSkyGame();

  late Score score;
  late NextPieValue nextPieValue;

  @override
  Future<void> onLoad() async {
    // add(score = Score());
    addAll([
      Background(),
      score = Score(),
      nextPieValue = NextPieValue(),
      for(int i = 0; i < 4; i++)
        Pie(score: score, nextPieValue: nextPieValue),

      Plate(),
    ]);
  }

// late NextPieValue nextPieValue;
// @override
// Future<void> onLoad() async {
//   addAll([
//     // nextPieValue = NextPieValue(),
//     // for(int i = 0; i <= 10; i++)
//     //   Pie(score: score, nextPieValue: nextPieValue),
//   ]);
// }

}