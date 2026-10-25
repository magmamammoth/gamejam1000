extends CharacterBody2D

const SPEED = 50.0
var collision_player: bool = false
var direction = 1

func _physics_process(delta: float) -> void:
	add_gravity(delta)
	move_guy()
	move_and_slide()
	reverse_direction()
	edge_space()

func add_gravity(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

func move_guy():
	velocity.x = SPEED * direction

func reverse_direction():
	if is_on_wall():
		direction = -direction
		$RayCast2D.position.x *= -1


func edge_space():
	if not $RayCast2D.is_colliding():
		direction = -direction
		$RayCast2D.position.x *= -1

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("sooo okk")
	if (body.name == "player"):
		print("heyyy")
		var y_delta = position.y - body.position.y
		#print(y_delta)
		if (y_delta < 15):
			print("decrease health")
			body.queue_free()
		if (y_delta > 15):
			print("dead")
			queue_free()
