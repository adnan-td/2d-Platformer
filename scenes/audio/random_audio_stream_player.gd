extends Node

@export var numberToPlay: int = 1
@export var enablePitchRandomization: bool = true
@export var minPitchScale: float = .9
@export var maxPitchScale: float = 1.1

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

func play():
	var validNodes = []
	for streamPlayer in get_children():
		if (!streamPlayer.playing):
			validNodes.append(streamPlayer)
	
	for i in numberToPlay:
		if (validNodes.size() == 0):
			break
		var idx = rng.randi_range(0, validNodes.size() - 1)
		
		if (enablePitchRandomization):
			validNodes[idx].pitch_scale = rng.randf_range(minPitchScale, maxPitchScale)
		
		validNodes[idx].play()
		validNodes.pop_at(idx)
