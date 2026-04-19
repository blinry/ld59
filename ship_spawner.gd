extends Node3D

@export var interval = 20 # seconds

const SHIP = preload("uid://de42481q0cwhl")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.wait_time = interval

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var extent = self.shape.size * 0.5

	var local_point = Vector3(
		randf_range(-extent.x, extent.x),
		0.0,
		randf_range(-extent.z, extent.z)
	)
	var global_point = local_point # ???
	global_point.y = 0
	
	var instance = SHIP.instantiate()
	add_child(instance)
	instance.global_position = global_point
	instance.look_at(Vector3.ZERO)
