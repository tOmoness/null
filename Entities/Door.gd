extends StaticBody2D
class_name Door

export(bool) var Locked = true
export(PackedScene) var target_scene

onready var sprite = $Sprite
onready var collider = $DoorCollision

func _ready():
	Global.Door = self

func _process(delta):
	if Locked:
		sprite.frame = 0
	else:
		sprite.frame = 1
		$DoorCollision.disabled = true

func unlock_door():
	Locked = false
