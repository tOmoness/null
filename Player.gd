extends KinematicBody2D

const MAX_SPEED = 80
const ACCELERATION = 2000

var motion = Vector2.ZERO

onready var sprite = $Sprite
onready var anim = $AnimationPlayer

func _process(delta):
	var camera = get_node("Camera2D")
	camera.position = position

func _physics_process(delta):
	var axis = get_axis_input()
	
	sprite.flip_h = axis.x < 0
	
	if axis == Vector2.ZERO:
		apply_friction(ACCELERATION * delta)
		anim.play("Idle")
	else:
		apply_movement(axis * ACCELERATION * delta)
		anim.play("Walk")
	
	motion = move_and_slide(motion)
	
func get_axis_input():
	var axis = Vector2.ZERO
	
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	return axis.normalized()

func apply_friction(friction):
	if motion.length() > friction:
		motion -= motion.normalized() * friction
	else:
		motion = Vector2.ZERO

func apply_movement(accl):
	motion += accl
	motion = motion.clamped(MAX_SPEED)
