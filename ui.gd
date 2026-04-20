extends Control

signal unpaused

@onready var score_label: Label = %ScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score_label.text = str(Globals.score) + "/" + str(get_tree().get_current_scene().get_commons().ships_needed)


func _on_start_pressed() -> void:
	if get_tree().get_current_scene().state == Globals.GameState.SETUP:
		get_tree().get_current_scene().enter_state(Globals.GameState.GAME)
		#$Button.text = "Pause"
		unpaused.emit()
		$Button.hide()
	elif get_tree().get_current_scene().state == Globals.GameState.GAME:
		get_tree().get_current_scene().enter_state(Globals.GameState.SETUP)
		#$Button.text = "Start"


func _on_reset_pressed() -> void:
	get_tree().reload_current_scene()
	Globals.score = 0


func _on_fullscreen_pressed() -> void:
	if DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED) 
