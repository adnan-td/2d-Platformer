extends HBoxContainer


func _ready():
	var base_levels = get_tree().get_nodes_in_group("base_level")
	
	if base_levels.size() > 0:
		base_levels[0].connect("coin_total_changed", on_coin_change)
		base_levels[0].connect("coin_collected", on_coin_change)
		update_display(base_levels[0].coins_current, base_levels[0].coins_total)
	else:
		update_display(0, 0)

func update_display(coins_current, coins_total):
	$Label.text = str(coins_current, "/", coins_total)
	

func on_coin_change(coins_current, coins_total):
	update_display(coins_current, coins_total)
	
