extends Node2D

var velocity = Vector2.ZERO

func _ready():
	$AudioStreamPlayer.pitch_scale = rand_range(0.75, 1)
	$AudioStreamPlayer.play()

func _process(delta):
	position += velocity * delta


func _on_Hitbox_area_entered(area):
	queue_free()


func _on_Hitbox_body_entered(body):
	queue_free()
