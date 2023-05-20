extends Node2D

func _ready():
	$Area2D.connect("area_entered", on_area_entered)
	
func on_area_entered(_area2d):
	$AnimationPlayer.play("pick_up")
	var base_level = get_tree().get_first_node_in_group("base_level")
	base_level.on_coin_collected()
