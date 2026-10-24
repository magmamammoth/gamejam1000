extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_area_2d_body_entered(body: Node2D) -> void:
	print("ok soooo")
	if (body.name == "testplayer"):
		print("heyyy")
		var y_delta = position.y - body.position.y
		if (y_delta < 30):
			print("decrease health")
		if (y_delta > 30):
			print("dead")
