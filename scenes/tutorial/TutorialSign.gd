extends Node2D

@export_multiline var text: String
var avail = 1

func _ready():
	$PanelContainer/MarginContainer/Label.text = text
	$PanelContainer.visible = false
	
	$Area2D.connect("area_entered", on_area_entered)
	$Area2D.connect("area_exited", on_area_exited)

func on_area_entered(_area2d):
	if avail > 0:
		$PanelContainer.visible = true
		$Sprite2D.frame = 1
		avail -= 1

func on_area_exited(_area2d):
	await get_tree().create_timer(1).timeout
	$PanelContainer.visible = false
	$Sprite2D.frame = 0
