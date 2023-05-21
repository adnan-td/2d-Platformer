extends CanvasLayer

func _ready():
	$OptionsMenu.connect("back_pressed", Callable(self, "on_back_pressed"))

func on_back_pressed():
	$"/root/ScreenTransitionManager".transition_to_menu()
