extends Node

@export var screenTransitionScene: PackedScene

func transition_to_scene(scenePath):
	for button in get_tree().get_nodes_in_group("animated_button"):
		button.disabled = true

	await get_tree().create_timer(.1).timeout
	var screenTransition = screenTransitionScene.instantiate()
	add_child(screenTransition)
	await screenTransition.screen_covered
	get_tree().change_scene_to_file(scenePath)

func transition_to_menu():
	transition_to_scene("res://scenes/ui/MainMenu.tscn")
