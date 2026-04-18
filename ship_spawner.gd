extends Node3D

const SHIP = preload("uid://de42481q0cwhl")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var instance = SHIP.instantiate()
	instance.global_position = Vector3(randf_range(-250,250),0,randf_range(-250,250))
	add_child(instance)
	instance.look_at(Vector3.ZERO)
