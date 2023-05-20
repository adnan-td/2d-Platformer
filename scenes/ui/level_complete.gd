extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$PanelContainer/MarginContainer/VBoxContainer/Button.connect("pressed", on_next_button_pressed)


func on_next_button_pressed():
	$"/root/LevelManager".increament_level()
