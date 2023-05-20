extends CharacterBody2D

enum Direction {LEFT, RIGHT}
@export var startDirection: Direction

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
	velocity.x = (DIRECTION * SPEED).x
	velocity.y += gravity * delta
	$AnimatedSprite2D.flip_h = true if DIRECTION.x > 0 else false


func _process(delta):
	move_and_slide()

func on_goal_entered(_area2d):
	DIRECTION *= -1

func on_hitbox_entered(_area2d):
	queue_free()
