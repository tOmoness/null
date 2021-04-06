extends Area2D

func _process(delta):
	for body in get_overlapping_bodies():
		if body.get_name() == "Player":
			get_tree().change_scene_to(get_parent().target_scene)
