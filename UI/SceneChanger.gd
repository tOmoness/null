extends CanvasLayer

onready var black := $Control/ColorRect
onready var anim := $AnimationPlayer

var end_screen = preload("res://UI/EndScreen.tscn")

func change_scene(target_scene: PackedScene):
	anim.play("Fade")
	yield(anim, "animation_finished")
	get_tree().change_scene_to(target_scene if target_scene != null else end_screen)
	anim.play_backwards("Fade")
	yield(anim, "animation_finished")
