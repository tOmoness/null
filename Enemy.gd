extends KinematicBody2D

func _physics_process(delta):
	$Sprite.flip_h = global_position > Global.Player.global_position
	var direction = global_position.direction_to(Global.Player.global_position)
	move_and_collide(direction * 10 * delta)


func _on_Hitbox_area_entered(area):
	queue_free()
