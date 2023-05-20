extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	var base_levels = get_tree().get_nodes_in_group("base_level")
	
	if base_levels.size() > 0:
		base_levels[0].connect("coin_total_changed", on_coin_change)
		base_levels[0].connect("coin_collected", on_coin_change)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_coin_change(coins_current, coins_total):
	$MarginContainer/HBoxContainer/Label.text = str(coins_current, "/", coins_total)
	
