extends Camera2D

@export var backgroundColor: Color = Color(0, 0, 0)

var targetPosition = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	RenderingServer.set_default_clear_color(backgroundColor)


func _process(delta):
	aquireTargetPosition()
	global_position = lerp(targetPosition, global_position, pow(2, -30 * delta))
	
	
func aquireTargetPosition():
	if !get_target_position_from_node_group("player"):
		get_target_position_from_node_group("player_death")


func get_target_position_from_node_group(group_name: String):
	var group = get_tree().get_nodes_in_group(group_name)
	if group.size() > 0:
		var player = group[0]
		targetPosition = player.global_position
		return true
	return false	
