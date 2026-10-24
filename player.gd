extends CharacterBody2D

const SPEED= 150.0
const JUMP_VELOCITY= -300.0

# Called when the node enters the scene tree for the first time.
func _physics_process(delta: float) -> void:
	# gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Move left and right
	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * SPEED
	move_and_slide()
