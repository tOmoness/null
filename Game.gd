extends Node2D

export(PackedScene) var start_scene

func _ready():
	get_tree().change_scene_to(start_scene)
