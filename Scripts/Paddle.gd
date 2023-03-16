extends Node2D

var paddleSpeed : float = 200
var hasBall : bool = false
var paddleVelocity : Vector2 = Vector2.ZERO

var ballRef

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setBall(ball):
	ballRef = ball
	add_child(ball)
	hasBall = true
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	paddleVelocity = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		paddleVelocity = Vector2.LEFT
		pass
	elif Input.is_action_pressed("move_right"):
		paddleVelocity = Vector2.RIGHT
		pass
		
	position += paddleVelocity * (delta * paddleSpeed)
		
	if hasBall:
		if Input.is_action_just_pressed("release_ball"):
			var globalPos = ballRef.global_position
			remove_child(ballRef)
			get_owner().add_child(ballRef)
			ballRef.releaseBall(globalPos, paddleVelocity)
			hasBall = false
	pass


func _on_paddle_area_area_entered(area):
	if hasBall:
		return
	
	if area.name == "BallArea":
		var ball = area.get_parent()
		ball.bounceBall(paddleVelocity)
	pass # Replace with function body.
