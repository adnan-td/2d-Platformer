extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	if velocity.x > 0:
		$Visuals.scale = Vector2(-1, 1)
		

func _physics_process(delta):
	velocity.y += gravity * delta
	
	if is_on_floor():
		velocity.x = lerp(0.0, velocity.x,  pow(2, -10 * delta))	
		
	
func _process(delta):
	move_and_slide()
	
