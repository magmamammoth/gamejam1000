extends Node

@onready var player: CharacterBody2D = $player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.SPEED = 350
	player.JUMP_VELOCITY = -450


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
