extends Marker2D

enum Direction {LEFT, RIGHT}

@export var direction: Direction
@export var enemy_scene: PackedScene

var currentEnemyNode = null
var spawnOnNextTick = false

func _ready():
	$SpawnTimer.connect("timeout", check_enemy_spawn)
	call_deferred("spawn_enemy")


func spawn_enemy():
	currentEnemyNode = enemy_scene.instantiate()
	currentEnemyNode.startDirection = direction
	currentEnemyNode.global_position = global_position
	get_parent().add_child(currentEnemyNode)
	
func check_enemy_spawn():
	if (!is_instance_valid(currentEnemyNode)):
		if spawnOnNextTick:
			spawn_enemy()
			spawnOnNextTick = false
		else:
			spawnOnNextTick = true
