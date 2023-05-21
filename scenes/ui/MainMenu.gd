extends CanvasLayer

@onready var playButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/PlayButton
@onready var optionsButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/OptionsButton
@onready var quitButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/QuitButton

func _ready():
	playButton.connect("pressed", on_play_pressed)
	quitButton.connect("pressed", on_quit_pressed)
	optionsButton.connect("pressed", on_options_pressed)

func on_play_pressed():
	$"/root/LevelManager".change_level(0)

func on_quit_pressed():
	get_tree().quit()

func on_options_pressed():
	$"/root/ScreenTransitionManager".transition_to_scene("res://scenes/ui/OptionsMenuStandalone.tscn")
