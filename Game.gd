extends Node2D

export(PackedScene) var start_scene

func _ready():
	SceneChanger.change_scene(start_scene)
