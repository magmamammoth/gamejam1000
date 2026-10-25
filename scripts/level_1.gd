extends Node2D

@onready var player: CharacterBody2D = $player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.scale = Vector2(0.1,0.1)
	player.JUMP_VELOCITY = -310


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
