extends Node3D


var state = Globals.GameState.SETUP

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func enter_state(state):
	self.state = state
	if state == Globals.GameState.GAME:
		get_tree().paused = false
	if state == Globals.GameState.SETUP:
		get_tree().paused = true
