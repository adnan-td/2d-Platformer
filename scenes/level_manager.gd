extends Node

@export var levelScenes: Array[PackedScene]

var currentLevelIndex = 0
# Called when the node enters the scene tree for the first time.



func change_level(index: int):
	if index >= levelScenes.size():
		return
	currentLevelIndex = index
	get_tree().change_scene_to_packed(levelScenes[currentLevelIndex])

func increament_level():
	change_level(currentLevelIndex + 1)
