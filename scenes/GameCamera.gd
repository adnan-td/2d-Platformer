extends Camera2D

@export var backgroundColor: Color = Color(0, 0, 0)

var targetPosition = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	RenderingServer.set_default_clear_color(backgroundColor)


func _process(delta):
	aquireTargetPosition()
	global_position = lerp(targetPosition, global_position, pow(2, -30 * delta))
	pass
	
	
func aquireTargetPosition():
	var playerGroup = get_tree().get_nodes_in_group("player")
	if playerGroup.size() > 0:
		var player = playerGroup[0]
		targetPosition = player.global_position
