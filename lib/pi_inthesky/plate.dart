import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:test_proj/pi_inthesky/pigame.dart';

class Plate extends PositionComponent with HasGameRef<PiInTheSkyGame>, DragCallbacks {

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

  resetPostion() {
    position = Vector2(gameRef.size.x / 2 - size.x / 2, gameRef.size.y * 0.9);
  }

}