extends Control

@onready var score_label: Label = %ScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score_label.text = str(Globals.score)


func _on_start_pressed() -> void:
	get_tree().get_current_scene().enter_state(Globals.GameState.GAME)
	$Button.visible = false
