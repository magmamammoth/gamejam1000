extends CharacterBody2D

const SPEED = 50.0

var direction = 1

func _physics_process(delta: float) -> void:
	add_gravity(delta)
	move_guy()
	move_and_slide()
	reverse_direction()

func add_gravity(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

func move_guy():
	velocity.x = SPEED * direction

func reverse_direction():
	if is_on_wall():
		direction = -direction


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("ok soooo")
	if (body.name == "testplayer"):
		print("heyyy")
		var y_delta = position.y - body.position.y
		if (y_delta < 30):
			print("decrease health")
		if (y_delta > 30):
			print("dead")
