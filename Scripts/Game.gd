extends Node2D

@export var brickScenes : Array[PackedScene]
@export var ballPrefab : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	var viewSize = get_viewport_rect().size
	$Paddle.position = Vector2(viewSize.x * 0.5, viewSize.y * 0.8)
	
	$LeftWallNode.position = Vector2(0, viewSize.y * 0.5)
	$RightWallNode.position = Vector2(viewSize.x, viewSize.y * 0.5)
	
	var level = brickScenes[0].instantiate()
	add_child(level)
	
	var ball = ballPrefab.instantiate()
	$Paddle.setBall(ball)
	ball.position.y += -12
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
