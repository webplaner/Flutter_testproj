import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:test_proj/pi_inthesky/pigame.dart';

class Background extends SpriteComponent with HasGameRef<PiInTheSkyGame> {
  Background();

  @override
  Future<void> onLoad() async {
    final image = await Flame.images.load('Sky.png');
    size = gameRef.size;
    sprite = Sprite(image);
  }
}