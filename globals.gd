extends Node

enum GameState {
	SETUP,
	GAME
}

enum LighthouseType {
	ATTRACT,
	REPEL,
	TURN_STARBOARD_SIDE,
	TURN_PORT_SIDE
}

var mouse_pos: Vector3
var score: int
var explosions = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
