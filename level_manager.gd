extends Node

const small_level = preload("uid://ckxfp2fmjudg8")
const big_level = preload("uid://6uv3yga8ptc2")

var levels = [small_level, big_level]
var current_level_id = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func load_next():
	current_level_id += 1
	var level = levels[current_level_id]
	get_tree().change_scene_to_packed(level)

func check_win_condition():
	if Globals.score >= 1:
		load_next()
