extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -390.0
@export var max_lean_angle: float = 6.0
@export var lean_speed:float = 10.0


@onready var player: Sprite2D = $Player_png


func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	# Add the gravity.
	move_and_slide()
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if direction > 0:
		player.flip_h = true
	if direction < 0:
		player.flip_h = false
	
	
	lean_effect(delta)


func lean_effect(delta: float) -> void:
	var target_angle:float = 0.0
	
	if abs(velocity.x) > 5.0:
		var dir_ratio: float = clamp(velocity.x / SPEED, -1, 1)
		target_angle = deg_to_rad(max_lean_angle * dir_ratio)
	
	player.rotation = lerp_angle(player.rotation, target_angle, lean_speed * delta)
	
