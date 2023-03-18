extends Node2D

func SetSprite(rect):
	$Sprite2D.region_rect = rect
	pass

func DestroyBrick():
	$BrickArea.queue_free()
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0,0), 0.35).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_BACK)
	pass
