extends Area2D

var scene_changed = false

func _process(delta):
	for body in get_overlapping_bodies():
		if body.get_name() == "Player" and not scene_changed:
			scene_changed = true
			SceneChanger.change_scene(get_parent().target_scene)
