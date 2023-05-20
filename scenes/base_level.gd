extends Node

signal coin_collected
signal coin_total_changed

@export var LevelCompleteScene: PackedScene

var playerScene = preload("res://scenes/player/player.tscn")
var spawnPos = Vector2.ZERO
var currentPlayerNode = null

var coins_total = 0
var coins_current = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	spawnPos = $Player.global_position
	register_player($Player)
	var initial_coins = get_tree().get_nodes_in_group("coins").size()
	on_coin_total_changed(initial_coins)
	$Flag/Flag.connect("player_won", on_player_won)
	

func on_coin_collected():
	coins_current += 1
	emit_signal("coin_collected", coins_current, coins_total)
	
func on_coin_total_changed(coins_count: int):
	coins_total = coins_count
	emit_signal("coin_total_changed", coins_current, coins_total)
	

func register_player(player):
	currentPlayerNode = player
	currentPlayerNode.connect("died", on_player_died, CONNECT_DEFERRED)

	
func create_player():
	var playerInstance = playerScene.instantiate()
	currentPlayerNode.add_sibling(playerInstance)
	playerInstance.global_position = spawnPos
	register_player(playerInstance)
	

func on_player_died():
	currentPlayerNode.queue_free()
	create_player()

func on_player_won():
	currentPlayerNode.queue_free()
	var levelcompletescene = LevelCompleteScene.instantiate()
	add_child(levelcompletescene)
