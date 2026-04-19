extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_level_unpaused() -> void:
	$Label.text = "Game phase:\n\nDrag the light cones!\n\nSteer enough ships close to the houses to win."
