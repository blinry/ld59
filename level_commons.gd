extends Node3D

signal unpaused

@export var ships_needed = 3
@export_multiline var description = "test!"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%Description.text = description

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_ui_unpaused() -> void:
	unpaused.emit()

func _input(event):
	if event.is_action_pressed("cheat"):
		Globals.score = 999
		LevelManager.check_win_condition()
