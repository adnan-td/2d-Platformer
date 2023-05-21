extends CanvasLayer

signal back_pressed

@onready var backButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/BackButton
@onready var windowModeButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/WindowModeButton
#@onready var musicRangeControl = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/MusicVolumeContainer/RangeControl
#@onready var sfxRangeControl = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/SFXVolumeContainer/RangeControl

var fullscreen = false

func _ready():
	windowModeButton.connect("pressed", Callable(self, "on_window_mode_pressed"))
	backButton.connect("pressed", Callable(self, "on_back_pressed"))
	#musicRangeControl.connect("percentage_changed", Callable(self, "on_music_volume_changed"))
	#sfxRangeControl.connect("percentage_changed", Callable(self, "on_sfx_volume_changed"))
	update_display()
	update_initial_volume_settings()

func update_display():
	windowModeButton.text = "WINDOWED" if !fullscreen else "FULLSCREEN"

func update_bus_volume(busName, volumePercent):
	var busIdx = AudioServer.get_bus_index(busName)
	var volumeDb = linear_to_db(volumePercent)
	AudioServer.set_bus_volume_db(busIdx, volumeDb)

func get_bus_volume_percent(busName):
	var busIdx = AudioServer.get_bus_index(busName)
	var volumePercent = db_to_linear(AudioServer.get_bus_volume_db(busIdx))
	return volumePercent

func update_initial_volume_settings():
	return
	var musicPercent = get_bus_volume_percent("Music")
	#musicRangeControl.set_current_percentage(musicPercent)
	
	var sfxPercent = get_bus_volume_percent("SFX")
	#sfxRangeControl.set_current_percentage(sfxPercent)


func on_window_mode_pressed():
	fullscreen = !fullscreen
	get_window().mode = Window.MODE_EXCLUSIVE_FULLSCREEN if (fullscreen) else Window.MODE_WINDOWED
	update_display()

func on_back_pressed():
	emit_signal("back_pressed")

func on_music_volume_changed(percent):
	update_bus_volume("Music", percent)

func on_sfx_volume_changed(percent):
	update_bus_volume("SFX", percent)
