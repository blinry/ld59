extends Node3D

signal unpaused

@export var ships_needed = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_ui_unpaused() -> void:
	unpaused.emit()
