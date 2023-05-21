extends Button

@export var disableHoverAnim: bool

func _ready():
	connect("mouse_entered", Callable(self, "on_mouse_entered"))
	connect("mouse_exited", Callable(self, "on_mouse_exited"))
	connect("focus_exited", Callable(self, "on_focus_exited"))
	connect("pressed", Callable(self, "on_pressed"))

func _process(delta):
	pivot_offset = custom_minimum_size / 2

func reset_button_state():
	if (!disableHoverAnim):
		$HoverAnimationPlayer.play_backwards("hover")

func on_mouse_entered():
	if (!disableHoverAnim):
		$HoverAnimationPlayer.play("hover")

func on_mouse_exited():
	reset_button_state()

func on_pressed():
	$ClickAnimationPlayer.play("click")

func on_focus_exited():
	reset_button_state()
