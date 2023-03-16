extends Node2D

func SetSprite(rect):
	$Sprite2D.region_rect = rect
	pass

func DestroyBrick():
	queue_free()
	pass
