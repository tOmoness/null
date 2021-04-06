extends KinematicBody2D

enum DIRECTION { UP = -1, DOWN = 1 }

var motion = Vector2.ZERO
var direction = DIRECTION.UP

func _physics_process(delta):
	if is_on_ceiling():
		direction = DIRECTION.DOWN
	if is_on_floor():
		direction = DIRECTION.UP
	
	motion.y += (300 * delta) * direction
	motion = move_and_slide(motion.clamped(100), Vector2.UP)
