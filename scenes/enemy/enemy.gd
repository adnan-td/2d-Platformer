extends CharacterBody2D

enum Direction {LEFT, RIGHT}
@export var startDirection: Direction
@export var enemyDeathScene: PackedScene
@export var isSpawning = false

const SPEED = 25.0
const JUMP_VELOCITY = -400.0
var DIRECTION = Vector2.ZERO
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	DIRECTION = Vector2.RIGHT if startDirection == Direction.RIGHT else Vector2.LEFT
	$GoalDetector.connect("area_entered", on_goal_entered)
	$HitboxArea.connect("area_entered", on_hitbox_entered)
	
func _physics_process(delta):
	if isSpawning:
		velocity.y += gravity * delta
		return
	velocity.x = (DIRECTION * SPEED).x
	velocity.y += gravity * delta
	$Visuals/AnimatedSprite2D.flip_h = true if DIRECTION.x > 0 else false


func _process(delta):
	move_and_slide()

func on_goal_entered(_area2d):
	DIRECTION *= -1

func kill():
	var deathInstance = enemyDeathScene.instantiate()
	get_parent().add_child(deathInstance)
	deathInstance.global_position = global_position
	if velocity.x > 0:
		deathInstance.scale = Vector2(-1, 1)
	queue_free()

func on_hitbox_entered(_area2d):
	call_deferred("kill")
