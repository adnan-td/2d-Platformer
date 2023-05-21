extends Node

@export var levelScenes: Array[PackedScene]

var currentLevelIndex = 0
 
func change_level(index: int):
	if index >= levelScenes.size():
		$"/root/ScreenTransitionManager".transition_to_scene("res://scenes/ui/GameComplete.tscn")
		return
	currentLevelIndex = index
	$"/root/ScreenTransitionManager".transition_to_scene(levelScenes[currentLevelIndex].resource_path)


func increament_level():
	change_level(currentLevelIndex + 1)

func restart_level():
	change_level(currentLevelIndex)
