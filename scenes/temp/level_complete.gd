extends CanvasLayer

func _ready():
	$MarginContainer/PanelContainer/MarginContainer/VBoxContainer/NextLevelButton.connect("pressed", Callable(self, "on_next_button_pressed"))
	$MarginContainer/PanelContainer/MarginContainer/VBoxContainer/RestartButton.connect("pressed", Callable(self, "on_restart_pressed"))
	
func on_next_button_pressed():
	$"/root/LevelManager".increment_level()

func on_restart_pressed():
	$"/root/LevelManager".restart_level()
