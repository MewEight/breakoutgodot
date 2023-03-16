extends Node2D

var velocity : Vector2 = Vector2.ZERO
var paused : bool
var ballCurrentSpeed : float

@export var ballInitialSpeed : float = 250
var collisionAlreadyOccured = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func releaseBall(initialPos, launchVelocity):
	position = initialPos
	position.y -= 10
	ballCurrentSpeed = ballInitialSpeed
	velocity = Vector2(launchVelocity.x, -1).normalized() * ballCurrentSpeed
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if paused:
		return
		
	collisionAlreadyOccured = false
	position += velocity * delta
	pass

func bounceBall(vel):
	var reflected = velocity.bounce(Vector2.DOWN)
	velocity = reflected.normalized() + vel
	velocity = velocity.normalized() * ballCurrentSpeed
	pass

func _on_area_2d_body_entered(body):
	var metadata = body.get_meta_list()
	if metadata.has("Wall"):
		velocity.x *= -1
	if metadata.has("TopWall"):
		velocity.y *= -1
	pass # Replace with function body.


func _on_area_2d_area_entered(area):
	if area.name == "BrickArea":
		var brick = area.get_parent()
		
		if !collisionAlreadyOccured:
			collisionAlreadyOccured = true
			# Only left and top collision
			if velocity.x > 0 and velocity.y > 0:
				if position.y > brick.position.y - 8:
					velocity.y *= -1
				else:
					velocity.x *= -1
				pass
			# Only bottom or right collision
			else:
				if position.y > brick.position.y + 8:
					velocity.y *= -1
				else:
					velocity.x *= -1
		
		brick.DestroyBrick()
	pass # Replace with function body.
