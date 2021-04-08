extends KinematicBody2D

onready var sprite = $Sprite
onready var audio = $AudioStreamPlayer

func _ready():
	audio.connect("finished", self, "destroy")

func _physics_process(delta):
	sprite.flip_h = global_position > Global.Player.global_position
	var direction = global_position.direction_to(Global.Player.global_position)
	move_and_collide(direction * 10 * delta)

func _on_Hitbox_area_entered(area):
	audio.play()
	sprite.visible = false

func destroy():
	queue_free()
