extends StaticBody2D

var locked = true

onready var sprite = $Sprite
onready var area = $Area2D/CollisionShape2D

func _process(delta):
	if locked:
		sprite.frame = 0
		area.disabled = true
	else:
		sprite.frame = 1
		area.disabled = false

func _on_Code_body_entered(body):
	locked = false

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		Global.Door.unlock_door()
