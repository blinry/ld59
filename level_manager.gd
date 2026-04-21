extends Node

const small_level = preload("uid://ckxfp2fmjudg8")
const big_level = preload("uid://6uv3yga8ptc2")

const tutorial = preload("uid://vn0buurvd0c6")
const evergiven = preload("uid://bvyygmmco2f2j")
const spiral = preload("uid://cfig1wr5luath")
const bay = preload("uid://d0ytexhnu3x6k")
const push = preload("uid://dpuy4edkojv5t")


var levels = [
	tutorial,
	bay,
	spiral,
	push,
	evergiven,
	big_level,
]
var current_level_id = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func load_next():
	current_level_id += 1
	Globals.score = 0
	
	if current_level_id == 0:
		$Start.play()
	
	if current_level_id == levels.size():
		get_tree().change_scene_to_file("uid://bitc64oyshwv4")
	else:
		var level = levels[current_level_id]
		get_tree().change_scene_to_packed(level)

func check_win_condition():
	var ships_needed = get_tree().get_current_scene().get_commons().ships_needed
	if Globals.score >= ships_needed:
		$Win.play()
		load_next()
