extends CanvasLayer

@onready var continueButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/ContinueButton

func _ready():
	continueButton.connect("pressed", on_continue_pressed)
	
func on_continue_pressed():
	$"/root/ScreenTransitionManager".transition_to_menu()
