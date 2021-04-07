extends CanvasLayer

onready var black := $Control/ColorRect
onready var anim := $AnimationPlayer

func change_scene(target_scene: PackedScene):
	anim.play("Fade")
	yield(anim, "animation_finished")
	get_tree().change_scene_to(target_scene)
	anim.play_backwards("Fade")
	yield(anim, "animation_finished")
