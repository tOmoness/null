extends Node2D

export(PackedScene) var start_scene

func _on_Start_pressed():
	SceneChanger.change_scene(start_scene)
